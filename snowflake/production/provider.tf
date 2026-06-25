provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.17.0"
    }
  }
}

provider "snowflake" {}
