
This folder contains the dbt project used for the Netflix Analytics Data Engineering pipeline.

## Purpose

The dbt project is responsible for transforming raw data stored in Snowflake into analytics-ready datasets using modular SQL models.

## Project Structure

- **staging/** – Cleans and standardizes raw source data.
- **dim/** – Dimension tables.
- **fct/** – Fact tables.
- **mart/** – Business-ready models used by Power BI dashboards.
- **snapshots/** – Tracks historical changes.
- **seeds/** – Static reference data.
- **tests/** – Custom data quality tests.

## Technologies

- dbt
- Snowflake
- SQL

## Running the Project

```bash
dbt run
dbt test
dbt docs generate
dbt docs serve