FROM python:3.12.3-slim

WORKDIR /usr/dbt_src

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY angel_city_project/ ./angel_city_project/

COPY run_dbt.sh .

RUN chmod +x run_dbt.sh

CMD ["./run_dbt.sh"]
