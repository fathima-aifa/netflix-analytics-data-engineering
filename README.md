# 🎬 Netflix Analytics Data Engineering Project

##  Project Overview

This project was built to gain hands-on experience in building a modern end-to-end data engineering pipeline. Instead of focusing only on dashboard development, this project explores how raw data is collected, transformed, and prepared before it becomes business-ready for reporting and analysis.

The MovieLens dataset was chosen because it contains real-world movie ratings, movie information, and user interactions, making it a suitable dataset for building analytics and reporting solutions.

The MovieLens dataset is stored in AWS S3, loaded into Snowflake, transformed using dbt, and finally visualized in Power BI. The final dashboard provides insights into movie popularity, genre performance, user engagement, and movie quality.

This project helped me gain practical experience with ELT architecture, SQL transformations, cloud data warehousing, and business intelligence tools.



##  Project Objectives

- Build a complete ELT data pipeline using modern cloud technologies.
- Learn and implement data transformation using **dbt**.
- Design a structured data model using staging, dimension, fact, and business mart layers.
- Perform data quality testing and documentation using dbt.
- Develop interactive Power BI dashboards for business insights.
- Understand how raw operational data can be transformed into decision-ready information.



##  Project Architecture

```text
MovieLens Dataset
        │
        ▼
     AWS S3
        │
        ▼
   Snowflake
(Data Warehouse)
        │
        ▼
       dbt
(Data Transformation)
        │
        ▼
   Power BI Dashboard
```



##  Why dbt?

In this project, **dbt (data build tool)** serves as the transformation layer of the ELT pipeline.

Instead of modifying raw data directly, dbt uses modular SQL models to transform data inside Snowflake into clean, reusable datasets.

Using dbt in this project allowed me to:

- Build reusable SQL models.
- Separate raw, staging, and business-ready datasets.
- Create Dimension, Fact, and Mart tables.
- Perform automated data quality testing.
- Generate project documentation and data lineage.
- Maintain a scalable and organized analytics workflow.



##  Data Models Built

The project implements a layered data modeling approach consisting of:

- **Staging Models** – Clean and standardize raw data.
- **Dimension Models** – Store descriptive business entities.
- **Fact Models** – Store measurable business events.
- **Mart Models** – Business-ready datasets optimized for reporting and dashboards.



##  Dashboard Highlights

The Power BI dashboard provides insights into:

- Movie popularity analysis
- Genre performance
- Movie quality distribution
- User engagement
- Platform summary statistics

*(Dashboard preview will be added here.)*



###  Technologies Used

**Cloud & Storage**
- AWS S3
- Snowflake

**Data Transformation**
- dbt
- SQL

**Visualization**
- Power BI

**Version Control**
- Git
- GitHub


##  Future Enhancements

- Build a movie recommendation engine using Python.
- Implement incremental dbt models.
- Automate pipeline execution using orchestration tools.
- Deploy dashboards for cloud-based reporting.
- Add advanced business analytics and KPIs.