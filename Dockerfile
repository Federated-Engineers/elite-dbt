# FROM python:3.11-slim

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libpq-dev \
#     git \
#     && rm -rf /var/lib/apt/lists/*

# # Set working directory
# WORKDIR /usr/app

# # Copy requirements first
# COPY requirements.txt .

# # Install dbt core + adapters
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy your dbt project into the container
# COPY . .

# CMD ["dbt", "--help"]

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