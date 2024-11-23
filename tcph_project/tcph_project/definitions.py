from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import snowflakeDbt_ELT_dbt_assets
from .project import snowflakeDbt_ELT_project
from .schedules import schedules

defs = Definitions(
    assets=[snowflakeDbt_ELT_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=snowflakeDbt_ELT_project),
    },
)