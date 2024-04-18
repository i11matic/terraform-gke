resource "kubernetes_namespace" "this" {
  metadata {
    annotations = var.k8_deployment.annotations

    labels = var.k8_deployment.labels

    name = var.k8_deployment.namespace
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name   = var.k8_deployment.name
    labels = var.k8_deployment.labels
  }

  spec {
    replicas = var.k8_deployment.replicas

    selector {
      match_labels = var.k8_deployment.match_labels
    }

    template {
      metadata {
        labels = var.k8_deployment.labels
      }

      spec {
        container {
          image = var.k8_deployment.image_name
          name  = var.k8_deployment.name

          resources {
            limits = {
              cpu    = var.k8_deployment.limits.cpu
              memory = var.k8_deployment.limits.memory
            }
            requests = {
              cpu    = var.k8_deployment.requests.cpu
              memory = var.k8_deployment.requests.memory
            }
          }

          liveness_probe {
            http_get {
              path = var.k8_deployment.health_check.path
              port = var.k8_deployment.health_check.port
            }

            initial_delay_seconds = var.k8_deployment.health_check.initial_delay_seconds
            period_seconds        = var.k8_deployment.health_check.period_seconds
          }
        }
      }
    }
  }
}
