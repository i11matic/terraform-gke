project_id = "gke-test-420601"

region = "northamerica-northeast1"

gke_cluster_name = "gke-test"

k8_namespaces = {
  foobar = {
    labels = {
      test = "bar"
    }
    annotations = {
      name = "value"
    }
  }
}

k8_workload_identities = {
  service_account_name = "app-test"
  namespace            = "foobar"
  roles                = ["roles/cloudsql.client"]
}

# k8_deployments = {
#   nginx = {
#     namespace = "foobar"
#     labels = {
#       test = "bar"
#     }
#     annotations = {
#       name = "value"
#     }
#     name     = "test-deployment"
#     replicas = 1
#     match_labels = {
#       test = "test"
#     }
#     env = {
#       foobar : "baz"
#       yolo : "fire"
#     }
#     image_name = "nginx:1.21.6"
#     limits = {
#       cpu    = "0.5"
#       memory = "512Mi"
#     }
#     requests = {
#       cpu    = "250m"
#       memory = "50Mi"
#     }
#     health_check = {
#       path                  = "/"
#       port                  = 80
#       initial_delay_seconds = 3
#       period_seconds        = 3
#     }
#   }
# } 
