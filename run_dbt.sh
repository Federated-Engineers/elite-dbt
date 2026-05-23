#!/bin/sh

echo "Running dbt run for elite_dbt_project"

dbt run \
  --project-dir elite_dbt_project \
  --profiles-dir elite_dbt_project
  