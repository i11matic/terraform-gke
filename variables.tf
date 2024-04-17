variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
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
