"""
To add a daily schedule that materializes your dbt assets, uncomment the following lines.
"""
from dagster_dbt import build_schedule_from_dbt_selection

from .assets import snowflakeDbt_ELT_dbt_assets

schedules = [
     build_schedule_from_dbt_selection(
         [snowflakeDbt_ELT_dbt_assets],
         job_name="materialize_dbt_models",
         cron_schedule="0 7 */2 * *",
         dbt_select="fqn:*",
     ),
]