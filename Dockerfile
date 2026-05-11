FROM python:3.12.3-slim

# Set working directory
WORKDIR /usr/app

# Copy requirements first
COPY requirements.txt .

# Install dbt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project
COPY . .

CMD ["dbt", "--help"]