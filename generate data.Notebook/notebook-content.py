# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "023336ad-ad68-40ff-b90a-063128753fb0",
# META       "default_lakehouse_name": "demolakehouse",
# META       "default_lakehouse_workspace_id": "0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc",
# META       "known_lakehouses": [
# META         {
# META           "id": "023336ad-ad68-40ff-b90a-063128753fb0"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
# Check the active Spark session's runtime version and warn if it's older than Fabric Runtime 2.0 (Spark 4.x)
current_spark_version = spark.version
current_major_version = int(current_spark_version.split(".")[0])
required_major_version = 4  # Fabric Runtime 2.0 ships Apache Spark 4.x

if current_major_version < required_major_version:
    print(
        f"WARNING: This session is running Apache Spark {current_spark_version}, which is an older Fabric runtime "
        f"(Runtime 2.0 ships Spark 4.x).\n"
        f"Later cells in this notebook are validated against Fabric Runtime 2.0 and may behave unexpectedly on this version.\n\n"
        f"To fix: Workspace settings > Data Engineering/Science > Spark settings > Environment tab > Runtime version > "
        f"select '2.0 Public Preview (Spark 4.1, Delta 4.2)', save, then restart this notebook's session."
    )
else:
    print(f"Running Apache Spark {current_spark_version} (Fabric Runtime 2.0 or later) - looks good.")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Install LakeBench and its optional extras
!pip install lakebench[duckdb,polars,tpcds_datagen,tpch_datagen,sparkmeasure]


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Generate TPC-DS data into the attached Lakehouse's Files area

from lakebench.datagen import TPCHDataGenerator

datagen = TPCHDataGenerator(
    scale_factor=300,
    target_folder_uri='/lakehouse/default/Files/tpch_sf300'
)
datagen.run()


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
