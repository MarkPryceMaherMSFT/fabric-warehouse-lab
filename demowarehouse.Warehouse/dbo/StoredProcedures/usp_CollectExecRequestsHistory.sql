CREATE PROCEDURE dbo.usp_CollectExecRequestsHistory
    @TargetSchema    VARCHAR(128) = 'dbo',
    @TargetTable     VARCHAR(128) = 'ExecRequestsHistory',
    @IncludeMaster   BIT          = 0,
    @ShowTopQueries  BIT          = 1,
    @Debug           BIT          = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @target VARCHAR(261);
    SET @target = '[' + REPLACE(@TargetSchema, ']', ']]') + '].['
                      + REPLACE(@TargetTable,  ']', ']]') + ']';

    -- Source that the trailing summary / top-query result sets read from:
    -- the physical table in Warehouse mode, or the #temp in endpoint mode.
    DECLARE @src VARCHAR(261);
    --------------------------------------------------------------------------
    -- 0. Auto-detect the platform from the current database Edition and set
    --    the internal @use_temp_tables flag (kept as a variable, not a param).
    --      Edition 'LakeWarehouse' -> SQL analytics endpoint -> temp mode (1)
    --      Edition 'DataWarehouse' -> Fabric Warehouse       -> table mode (0)
    --      anything else           -> default to table mode  (0)
    --------------------------------------------------------------------------
    DECLARE @use_temp_tables BIT = 0;
    DECLARE @Edition VARCHAR(128) =
        CONVERT(varchar(128), DATABASEPROPERTYEX(db_name(), 'Edition'));

    IF @Edition = 'LakeWarehouse'
        SET @use_temp_tables = 1;   -- Fabric SQL analytics endpoint (read-only)
    ELSE
        SET @use_temp_tables = 0;   -- Fabric Warehouse (writable), or unknown

    IF @Debug = 1
        PRINT 'Detected DB = ' + db_name()
            + ' | Edition = ' + ISNULL(@Edition, '(null)')
            + ' | @use_temp_tables = ' + CAST(@use_temp_tables AS varchar(1))
            + ' (' + CASE WHEN @use_temp_tables = 1
                          THEN 'SQL analytics endpoint mode'
                          ELSE 'Warehouse mode' END + ')';

    --------------------------------------------------------------------------
    -- 1. Build a shaped, EMPTY #temp collector from the query itself.
    --    WHERE 1 = 0 gives us the exact column names + types with no rows.
    --    (Supported on both Warehouse and SQL analytics endpoint.)
    --------------------------------------------------------------------------
    DROP TABLE IF EXISTS #ExecRequestsHistory;

    SELECT
        CONVERT(varchar(128), DATABASEPROPERTYEX(db_name(),   'Edition'))     AS Edition,
        CONVERT(varchar(128), DATABASEPROPERTYEX('master',    'workspaceid')) AS WorkSpaceId,
        CONVERT(varchar(128), DATABASEPROPERTYEX(db_name(),   'ArtifactId'))  AS ArtifactId,
        DATEDIFF(second, submit_time, end_time)                               AS Query_Time_sec,
        *
    INTO #ExecRequestsHistory
    FROM [queryinsights].[exec_requests_history]
    WHERE 1 = 0;

    --------------------------------------------------------------------------
    -- 2. Capture the database list into a scalar VARIABLE (singleton read).
    --------------------------------------------------------------------------
    DECLARE @dbList VARCHAR(MAX);

    SELECT @dbList =
        STRING_AGG(CAST(name AS varchar(128)) COLLATE Latin1_General_100_BIN2_UTF8, '|')
    FROM sys.databases
    WHERE @IncludeMaster = 1
       OR CAST(name AS varchar(128)) COLLATE Latin1_General_100_BIN2_UTF8 <> 'master';

    IF @dbList IS NULL SET @dbList = '';

    --------------------------------------------------------------------------
    -- 3. Parse the string and collect from each database (three-part read).
    --------------------------------------------------------------------------
    DECLARE @db    VARCHAR(128),
            @dbLit VARCHAR(260),   -- safe inside a '...' string literal
            @dbId  VARCHAR(260),   -- safe as a [bracketed] identifier
            @sql   VARCHAR(MAX),
            @pos   INT;

    WHILE LEN(@dbList) > 0
    BEGIN
        SET @pos = CHARINDEX('|', @dbList);
        IF @pos = 0
        BEGIN
            SET @db     = @dbList;
            SET @dbList = '';
        END
        ELSE
        BEGIN
            SET @db     = LEFT(@dbList, @pos - 1);
            SET @dbList = SUBSTRING(@dbList, @pos + 1, LEN(@dbList));
        END

        IF LEN(@db) = 0 CONTINUE;

        SET @dbLit = REPLACE(@db, '''', '''''');
        SET @dbId  = '[' + REPLACE(@db, ']', ']]') + ']';

        -- #ExecRequestsHistory is created in this proc's scope, so it is visible
        -- to the child scope created by EXEC(@sql) and can be inserted into.
        SET @sql =
            'INSERT INTO #ExecRequestsHistory' + CHAR(10) +
            'SELECT' + CHAR(10) +
            '    CONVERT(varchar(128), DATABASEPROPERTYEX(''' + @dbLit + ''', ''Edition'')),'    + CHAR(10) +
            '    CONVERT(varchar(128), DATABASEPROPERTYEX(''master'', ''workspaceid'')),'         + CHAR(10) +
            '    CONVERT(varchar(128), DATABASEPROPERTYEX(''' + @dbLit + ''', ''ArtifactId'')),' + CHAR(10) +
            '    DATEDIFF(second, submit_time, end_time),'                                        + CHAR(10) +
            '    *'                                                                               + CHAR(10) +
            'FROM ' + @dbId + '.[queryinsights].[exec_requests_history];';

        IF @Debug = 1 PRINT @sql;

        BEGIN TRY
            EXEC (@sql);
            PRINT 'Collected: ' + @db;
        END TRY
        BEGIN CATCH
            PRINT 'Skipped  : ' + @db + '  ->  ' + ERROR_MESSAGE();
        END CATCH;
    END;

    --------------------------------------------------------------------------
    -- 4. Output the collected rows.
    --------------------------------------------------------------------------
    IF @use_temp_tables = 0
    BEGIN
        ----------------------------------------------------------------------
        -- WAREHOUSE MODE: persist #temp -> physical table
        -- (create-if-missing / clear-down). Source is a distributed #temp,
        -- so this write is allowed. Requires a Warehouse (not an endpoint).
        ----------------------------------------------------------------------
        IF OBJECT_ID(@target) IS NULL
        BEGIN
            SET @sql = 'SELECT * INTO ' + @target + ' FROM #ExecRequestsHistory WHERE 1 = 0;';
            IF @Debug = 1 PRINT @sql;
            EXEC (@sql);
        END

        SET @sql = 'TRUNCATE TABLE ' + @target + ';';   -- clear it down
        IF @Debug = 1 PRINT @sql;
        EXEC (@sql);

        SET @sql = 'INSERT INTO ' + @target + ' SELECT * FROM #ExecRequestsHistory;';
        IF @Debug = 1 PRINT @sql;
        EXEC (@sql);

        DROP TABLE IF EXISTS #ExecRequestsHistory;

        PRINT 'Done. Collected query history into ' + @target;

        ------------------------------------------------------------------------
        -- 5a. Return a per-database summary (read from the physical table).
        ------------------------------------------------------------------------
        SET @sql =
            'SELECT ArtifactId, database_name, Edition,' + CHAR(10) +
            '       COUNT(*)            AS Requests,'     + CHAR(10) +
            '       MAX(Query_Time_sec) AS MaxQuerySec,'  + CHAR(10) +
            '       MIN(submit_time)    AS FirstSeen,'    + CHAR(10) +
            '       MAX(submit_time)    AS LastSeen'      + CHAR(10) +
            'FROM ' + @target + CHAR(10) +
            'GROUP BY ArtifactId, database_name, Edition' + CHAR(10) +
            'ORDER BY Requests DESC;';
        EXEC (@sql);

        -- Trailing top-query result sets (step 6) read from the physical table.
        SET @src = @target;
    END
    ELSE
    BEGIN
        ----------------------------------------------------------------------
        -- SQL ANALYTICS ENDPOINT MODE: the endpoint cannot host a physical
        -- table, so return the collected rows directly as result sets.
        ----------------------------------------------------------------------
        PRINT 'Done. Temp-table mode: returning collected query history as result sets '
            + '(no physical table written - SQL analytics endpoint).';

        ------------------------------------------------------------------------
        -- 5b. Result set 1: the full collected data set.
        ------------------------------------------------------------------------
        SELECT * FROM #ExecRequestsHistory;

        ------------------------------------------------------------------------
        -- 5c. Result set 2: the same per-database summary as Warehouse mode.
        ------------------------------------------------------------------------
        SELECT ArtifactId, database_name, Edition,
               COUNT(*)            AS Requests,
               MAX(Query_Time_sec) AS MaxQuerySec,
               MIN(submit_time)    AS FirstSeen,
               MAX(submit_time)    AS LastSeen
        FROM #ExecRequestsHistory
        GROUP BY ArtifactId, database_name, Edition
        ORDER BY Requests DESC;

        -- Trailing top-query result sets (step 6) read from the #temp table.
        -- (The #temp is visible to the EXEC() child scope, so dynamic SQL can
        --  read it; it is dropped after step 6 below.)
        SET @src = '#ExecRequestsHistory';
    END

    --------------------------------------------------------------------------
    -- 6. Optional extra result sets: the heaviest query shapes (by query_hash).
    --    Same output on both platforms - only @src (the source table) differs.
    --    Set @ShowTopQueries = 0 to suppress these.
    --------------------------------------------------------------------------
    IF @ShowTopQueries = 1
    BEGIN
        ----------------------------------------------------------------------
        -- 6a. Top 20 query shapes by TOTAL CPU used (allocated_cpu_time_ms).
        ----------------------------------------------------------------------
        SET @sql =
            'SELECT TOP 20'                                                        + CHAR(10) +
            '       query_hash,'                                                   + CHAR(10) +
            '       COUNT(*)                              AS Executions,'          + CHAR(10) +
            '       SUM(CAST(allocated_cpu_time_ms AS bigint)) AS TotalCpuMs,'     + CHAR(10) +
            '       AVG(CAST(allocated_cpu_time_ms AS bigint)) AS AvgCpuMs,'       + CHAR(10) +
            '       SUM(CAST(total_elapsed_time_ms AS bigint)) AS TotalElapsedMs,' + CHAR(10) +
            '       MAX(LEFT(command, 200))               AS sample_command'       + CHAR(10) +
            'FROM ' + @src                                                         + CHAR(10) +
            'GROUP BY query_hash'                                                  + CHAR(10) +
            'ORDER BY TotalCpuMs DESC;';
        IF @Debug = 1 PRINT @sql;
        EXEC (@sql);

        ----------------------------------------------------------------------
        -- 6b. Top 20 query shapes by TOTAL query time (total_elapsed_time_ms).
        ----------------------------------------------------------------------
        SET @sql =
            'SELECT TOP 20'                                                        + CHAR(10) +
            '       query_hash,'                                                   + CHAR(10) +
            '       COUNT(*)                              AS Executions,'          + CHAR(10) +
            '       SUM(CAST(total_elapsed_time_ms AS bigint)) AS TotalElapsedMs,' + CHAR(10) +
            '       AVG(CAST(total_elapsed_time_ms AS bigint)) AS AvgElapsedMs,'   + CHAR(10) +
            '       SUM(CAST(allocated_cpu_time_ms AS bigint)) AS TotalCpuMs,'     + CHAR(10) +
            '       MAX(LEFT(command, 200))               AS sample_command'       + CHAR(10) +
            'FROM ' + @src                                                         + CHAR(10) +
            'GROUP BY query_hash'                                                  + CHAR(10) +
            'ORDER BY TotalElapsedMs DESC;';
        IF @Debug = 1 PRINT @sql;
        EXEC (@sql);
    END

    -- Clean up the session #temp (already dropped in Warehouse mode; harmless).
    DROP TABLE IF EXISTS #ExecRequestsHistory;
END;