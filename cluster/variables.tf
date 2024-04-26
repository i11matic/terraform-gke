variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}

variable "router_name" {
  type        = string
  description = "Name for the router and nat gateway"
}

variable "authorized_networks" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default     = []
  description = "list of network objects that will have access to the master api"
}

variable "gcp_activate_apis" {
  type        = list(string)
  description = "list of services to enable"
  default     = []
}

variable "gke_network_name" {
  type        = string
  description = "Name of the network"
}

variable "gke_subnetwork" {
  type = object({
    name = string
    cidr = string
  })
  description = "Configuration for  gke subnetwork"
}


variable "gke_master_auth_subnetwork" {
  type = object({
    name = string
    cidr = string
  })
  description = "Configuration of gke master authorized network"
}

variable "gke_pod_range" {
  type = object({
    name = string
    cidr = string
  })
  description = "Configuration of the gke pod range"
}

variable "gke_svc_range" {
  type = object({
    name = string
    cidr = string
  })
  description = "Configuration of the gke svc range"
}


variable "gke_cluster_name" {
  type        = string
  description = "name of the gke cluster"
}

variable "gke_regional_deployment" {
  type        = bool
  description = "enable regional"
  default     = true
}

variable "gke_master_ipv4_cidr_block" {
  type        = string
  description = "cidr block for the master k8s api"
}

variable "gke_firewall_inbound_ports" {
  type        = list(string)
  description = "list of inbound firewall ports"
  default     = []
}

variable "gke_node_pools" {
  type        = list(map(string))
  description = "List of maps containing node pools"

  default = [
    {
      name = "default-node-pool"
    },
  ]
}

variable "kubernetes_version" {
  type        = string
  description = "kuberentes version"
  default     = "latest"
}

variable "gke_deletion_protection" {
  type        = bool
  description = "enable delete protection"
  default     = false
}

variable "sql_enabled" {
  type        = bool
  description = "enable sql deployment"
  default     = false
}

variable "sql_instance_name" {
  type        = string
  description = "name of the sql instance"
  default     = ""

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
  default     = "SQLSERVER_2022_STANDARD"
}

variable "sql_deletion_protection" {
  type        = bool
  description = "enable delete protection"
  default     = false
}

variable "sql_tier" {
  type        = string
  description = "tier for the sql instance"
  default     = "db-custom-10-65536"
}

variable "sql_private_ip_alloc" {
  type        = string
  description = "private network address"
  default     = ""
}

variable "sql_private_network_id" {
  type        = string
  description = "private network id"
  default     = ""
}

variable "artifact_registry_name" {
  type        = string
  description = "name of the artifact registry"
  default     = ""
}
