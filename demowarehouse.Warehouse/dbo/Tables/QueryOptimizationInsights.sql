CREATE TABLE [dbo].[QueryOptimizationInsights] (

	[query_hash] varchar(200) NOT NULL, 
	[sample_command] varchar(8000) NULL, 
	[number_of_runs] int NULL, 
	[avg_total_elapsed_ms] int NULL, 
	[issues] varchar(max) NULL, 
	[new_query] varchar(max) NULL, 
	[predicate_columns] varchar(max) NULL, 
	[tables_used] varchar(max) NULL, 
	[analyzed_at] datetime2(6) NULL
);