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

## **Steps to Run the Project**

### **Prerequisites**

1. A Snowflake account with appropriate roles and permissions to create and manage databases and tables.
2. Python environment with necessary libraries installed:
    - Dagster
    - dbt-core
    - Dagster-Snowflake, Dagster-dbt
3. A dbt project set up and configured to connect to Snowflake.

---

### **Project Setup**

1. **Clone the Repository**:
    
    ```bash
    bash
    Sao chép mã
    git clone https://github.com/<your-repo>/dbt-snowflake-dagster.git
    cd dbt-snowflake-dagster
    
    ```
    
2. **Configure dbt Profiles**:
    
    In the `~/.dbt/profiles.yml`, set up the Snowflake connection:
    
    ```yaml
    yaml
    Sao chép mã
    snowflake_project:
      target: dev
      outputs:
        dev:
          type: snowflake
          account: <your_account>
          user: <your_user>
          password: <your_password>
          role: <your_role>
          database: <your_database>
          schema: <your_schema>
          warehouse: <your_warehouse>
    
    ```
    
3. **Configure Dagster**:
    
    Modify the `dagster.yaml` to include dbt resources and Snowflake connection.
    
4. **Run Dagster**:
    
    Start the Dagster UI:
    
    ```bash
    bash
    Sao chép mã
    dagit
    
    ```
    
    Dagster Daemon should also be running for schedules or sensors:
    
    ```bash
    bash
    Sao chép mã
    dagster-daemon run
    
    ```
    
5. **Trigger the Pipeline**:
    
    From the Dagster UI, manually run the pipeline or configure schedules to automate execution.
    

---

## **Folder Structure**

```bash
bash
Sao chép mã
dbt-snowflake-dagster/
│
├── dbt_project/
│   ├── models/          # dbt models
│   ├── seeds/           # Sample seed data
│   ├── dbt_project.yml  # dbt configuration
│
├── dagster_project/
│   ├── assets.py        # Dagster assets
│   ├── schedules.py     # Dagster schedules
│   ├── definitions.py   # Dagster pipeline definitions
│
└── README.md            # Project Documentation

```

---

## **Learning Outcomes**

Through this project, I gained a deeper understanding of:

1. How to integrate and orchestrate **dbt** workflows within **Dagster**.
2. Configuring and optimizing **Snowflake** as a scalable data warehouse.
3. The benefits of modular pipeline design for ease of debugging and scalability.
4. How to handle dependencies between tasks in a real-world ELT pipeline.

---

## **Future Improvements**

- Adding tests for dbt models and integrating test results into Dagster workflows.
- Implementing CI/CD pipelines for deploying dbt models.
- Expanding the project to include additional tools like Apache Airflow or Prefect for comparison.
- Using sensor-based triggers to handle real-time or event-driven data workflows.
