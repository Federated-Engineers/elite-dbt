variable "snowflake_role" {
  type        = string
  description = "The role in Snowflake that we will use to deploy"
}

variable "snowflake_account" {
  type        = string
  description = "The name of the Snowflake account that we will be deploying into"
}

variable "snowflake_org" {
  type        = string
  description = "The name of the Snowflake Organization we will be deploying into"
}

variable "snowflake_user" {
  type        = string
  description = "The name of the Snowflake user that we will be utilizing to deploy"
}

variable "snowflake_password" {
  type        = string
  description = "The name of the Snowflake password that we will be utilizing to deploy"
  sensitive   = true
}

variable "comment" {
  description = "A comment to apply to all resources"
  type        = string
  default     = "Created by terraform"
}

variable "snowflake_warehouse_name" {
  type        = string
  description = "Name of the Snowflake warehouse used for dbt workloads."
}

variable "snowflake_warehouse_size" {
  type        = string
  description = "Size of the Snowflake warehouse."
  default = "XSMALL"
}

variable "snowflake_warehouse_auto_suspend" {
  type        = number
  description = "Number of seconds of inactivity before the warehouse automatically suspends."
  default = 60
}

variable "snowflake_warehouse_auto_resume" {
  type        = bool
  description = "Whether the warehouse automatically resumes when a query is submitted."
  default = true
}

variable "snowflake_warehouse_initially_suspended" {
  type        = bool
  description = "Whether the warehouse should be created in a suspended state."
  default = true
}

variable "snowflake_warehouse_comment" {
  type        = string
  description = "Comment describing the purpose of the warehouse."
  default = "Warehouse for dbt workloads"
}

variable "disabled" {
  type    = bool
  default = false
}

variable "must_change_password" {
  type    = bool
  default = true
}

variable "disable_mfa" {
  type    = bool
  default = false
}
