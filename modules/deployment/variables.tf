variable "k8_deployment" {
  type = object({
    namespace    = string
    labels       = map(string)
    annotations  = map(string)
    name         = string
    replicas     = number
    match_labels = map(string)
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
  })
}
