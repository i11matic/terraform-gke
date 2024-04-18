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

variable "k8_deployments" {
  type = map(object({
    namespace    = string
    labels       = map(string)
    annotations  = map(string)
    name         = string
    replicas     = number
    match_labels = map(string)
    env          = map(string)
    image_name   = string
    limits = object({
      cpu    = string
      memory = string
    })
    requests = object({
      cpu    = string
      memory = string
    })
    health_check = object({
      path                  = string
      port                  = number
      initial_delay_seconds = number
      period_seconds        = number
    })
  }))
  description = "map of k8 deployment objects"
  default     = {}
}

variable "k8_namespaces" {
  type = map(object({
    labels      = map(string)
    annotations = map(string)
  }))
  default     = {}
  description = "map of namespace objects"
}
