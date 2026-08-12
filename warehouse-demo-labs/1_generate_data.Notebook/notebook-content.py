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

# MARKDOWN ********************

# # Fabric Warehouse Demo Labs: 1. Generate data
# 
# This notebook generates the TPC-H sample dataset used by the **`2_warehouse_labs`** notebook. Run every cell below, top to bottom, before opening `2_warehouse_labs`.
# 
# **Objective:** populate this Lakehouse's Files area with a 1 GB TPC-H dataset (`scale_factor=1`) so the Warehouse Labs notebook has data to load into tables.
# 
# **What you need to do:** run the cells below in order. Once this notebook finishes, open `2_warehouse_labs` and follow its instructions.

# MARKDOWN ********************

# ## 0. Verify your Fabric Spark runtime
# 
# This lab is validated against **Fabric Runtime 2.0 (Apache Spark 4.x)**. Running on an older runtime (e.g. Runtime 1.3 / Spark 3.5) can cause confusing errors later.
# 
# The cell below checks the Spark version of your **current session** and warns you if it's below 4.x. If you get a warning, go to **Workspace settings → Data Engineering/Science → Spark settings → Environment** tab, set **Runtime version** to **2.0 Public Preview (Spark 4.1, Delta 4.2)**, save, then restart this notebook's session.

# CELL ********************

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

# MARKDOWN ********************

# ## 1. Install the dependencies
# 
# This installs [LakeBench](https://github.com/microsoft/LakeBench), the open-source benchmarking library used here purely for its TPC-H data generator.

# CELL ********************

# Install LakeBench and its optional extras
!pip install lakebench[duckdb,polars,tpcds_datagen,tpch_datagen,sparkmeasure]

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# ## 2. Generate the TPC-H data
# 
# Generates a 1 GB TPC-H dataset (`scale_factor=1`) into this Lakehouse's `Files/tpch_sf1` folder. The `2_warehouse_labs` notebook loads its tables from this exact location.
# 
# Warning: increasing `scale_factor` generates proportionally more data and takes longer. If you do increase it, make sure to also update the `@datasize` variable in `2_warehouse_labs` to match the new folder name.

# CELL ********************

# Generate TPC-H data into the attached Lakehouse's Files area
from lakebench.datagen import TPCHDataGenerator

datagen = TPCHDataGenerator(
    scale_factor=1,
    target_folder_uri='/lakehouse/default/Files/tpch_sf1'
)
datagen.run()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# ## What's next?
# 
# Open the **`2_warehouse_labs`** notebook in this workspace and follow its instructions to load this data into Warehouse tables and work through the labs.
