# fabric-warehouse-lab

Hands-on labs for **Microsoft Fabric Data Warehouse**, using a TPC-H sample dataset. Covers data loading techniques, query performance tuning (clustering, custom SQL pools), warehouse recovery features (snapshots, time travel, table clones, restore points), the SQL analytics endpoint, and warehouse security (SQL audit logs).

## Structure

- **`warehouse-demo-labs/`** — the Fabric Jumpstart solution folder:
  - **`demolakehouse.Lakehouse`** — Lakehouse used to stage the generated TPC-H data.
  - **`demowarehouse.Warehouse`** — Fabric Warehouse with the TPC-H schema (`dbo.customer`, `dbo.lineitem`, `dbo.orders`, etc.) pre-created.
  - **`1_generate_data.Notebook`** — generates a 1 GB TPC-H dataset into the Lakehouse's Files area. **Run this first.**
  - **`2_warehouse_labs.Notebook`** — the main lab notebook. Loads the generated data into Warehouse tables, then walks through tuning, recovery, monitoring, and security exercises.

## Getting started

1. Run **`1_generate_data`** to generate the TPC-H sample data.
2. Open **`2_warehouse_labs`** and follow its instructions from the top.

Each notebook contains its own markdown instructions for every step — no separate setup guide is needed.
