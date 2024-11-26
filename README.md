# **dbt-Snowflake with Dagster Orchestration**

## **Overview**

This project use dbt to transform data sample on Snowflake and all of the work orchestrate by Dagster. 

In detail, the raw data will be transform through several  and then stored back to Snowflake as a data warehouse. And all the model and test in dbt will be orchestrated and scheduled by dagster.

It can be viewed as a ELT project except the extraction part, as it use sample data that is already available in Snowflake. 

This project was undertaken as part of my learning journey to build data pipleline.

![Biểu đồ không có tiêu đề drawio](https://github.com/user-attachments/assets/1a639d24-7432-45c3-b608-84cb470aea18)

---

## **Key Objectives**

- Learn and implement **Dagster** for orchestrating and scheduling data pipelines.
- Use **dbt** for data transformation and modeling in **Snowflake**.
- Understand how to manage workflows that integrate multiple tools and platforms.
- Having knowledges in ELT pipeline and the ability to learn about new tool.
---

## **Project Architecture**

1. **Data Source**:
    
    Raw data is assumed to be preloaded int
o a Snowflake staging table.
    
2. **Transformation Layer (dbt)**:
    - dbt (data build tool) is used for defining and running SQL-based transformations on Snowflake.
    - Models are created to clean, aggregate, and transform the data into a structure suitable for analytics.
    - Run dbt tests to validate data integrity and pipeline correctness.
3. **Orchestration (Dagster)**:
    - Dagster orchestrates the entire workflow:
        - Triggering dbt commands like `dbt run` and `dbt test`.
        - Monitoring the execution status and logging.
        - Scheduling and handling dependencies between tasks.
4. **Data Warehouse (Snowflake)**:
    - Acts as the central data store for raw, intermediate, and final transformed data.
5. **Visualization (Optional)**:
    - Once the pipeline is complete, transformed data can be visualized using tools like Tableau, Power BI, or other BI tools.

---


## **Folder Structure**

```bash
bash
Sao chép mã
dbt-snowflake-ELT/
│
├── dbt_project/
│   ├── models/          # dbt models
│   ├── seeds/           # Sample seed data
│   ├── dbt_project.yml  # dbt configuration
│   ├── tcph_dagster/
│       ├── tcph_project/
│           ├── assets.py        # Dagster assets
│           ├── schedules.py     # Dagster schedules
│           ├── definitions.py   # Dagster pipeline definitions
│           ├── project.py       # define path to the dbt project
|           └── ...
|
└──...

```

---

## **Learning Outcomes**

- How to integrate and orchestrate **dbt** workflows within **Dagster**. And understand some concept about how **dagster** work with dbt like the usage of manifest file.
- Configuring **Snowflake** as a scalable data warehouse. Learn how to transform data in separate steps in **dbt**, such as staging, fact tables, or view tables, and understand the advantages of transforming data this way.
- Self-learning new tools and effectively dealing with problems or bugs.

---

## **Future Improvements**

- Adding more useful tests for dbt models and integrating test results into Dagster workflows.
- Implementing CI/CD pipelines for deploying dbt models and understand the concept.
- Expanding the project to include additional tools like Apache Airflow or Prefect for comparison.
