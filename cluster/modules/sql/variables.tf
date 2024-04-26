variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}


variable "sql_instance_name" {
  type        = string
  description = "name of the sql instance"

}

variable "sql_server_audit_config" {
  description = "SQL server audit config settings."
  type        = map(string)
  default     = {}
}


variable "random_instance_name" {
  type        = bool
  description = "enable random instance name"
  default     = false

}

variable "database_version" {
  type        = string
  description = "database version for ms sql"
}

variable "sql_deletion_protection" {
  type        = bool
  description = "enable delete protection"
}

variable "sql_tier" {
  type        = string
  description = "tier for the sql instance"
}

variable "sql_private_ip_alloc" {
  type        = string
  description = "private network address"
}

variable "sql_private_network_id" {
  type        = string
  description = "private network id"
}
