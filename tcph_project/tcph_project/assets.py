from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import snowflakeDbt_ELT_project


@dbt_assets(manifest=snowflakeDbt_ELT_project.manifest_path)
def snowflakeDbt_ELT_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    