variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}


variable "gke_cluster_name" {
  type        = string
  description = "name of the gke cluster"
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

variable "k8_workload_identities" {
  type = map(object({
    service_account_name = string
    namespace            = string
    roles                = list(string)
  }))
  default = {}
}
