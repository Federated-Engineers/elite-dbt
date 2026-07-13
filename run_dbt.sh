#!/bin/sh

echo "Running dbt run for angel_city_healthcare_project"

dbt deps \
    --project-dir angel_city_project \
    --profiles-dir angel_city_project

dbt build \
    --project-dir angel_city_project \
    --profiles-dir angel_city_project \
    --target silver
