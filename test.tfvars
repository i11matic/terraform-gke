project_id = "gke-test-420601"

region = "northamerica-northeast1"

router_name = "gke-router"

gke_network_name = "gke-test"

gke_subnetwork = {
  name = "gke-subnet"
  cidr = "10.0.0.0/17"
}

gke_master_auth_subnetwork = {
  name = "gke-master-auth-subnet"
  cidr = "10.60.0.0/17"
}

gke_pod_range = {
  name = "ip-range-pods"
  cidr = "192.168.0.0/18"

}

gke_svc_range = {
  name = "ip-range-svc"
  cidr = "192.168.64.0/18"
}


gke_cluster_name = "gke-test"

gke_regional_deployment = true

gke_master_ipv4_cidr_block = "172.16.0.0/28"


k8_deployments = {
  nginx = {
    namespace = "foobar"
    labels = {
      test = "bar"
    }
    annotations = {
      name = "value"
    }
    name     = "test-deployment"
    replicas = 1
    match_labels = {
      test = "test"
    }
    env = {
      foobar : "baz"
      yolo : "fire"
    }
    image_name = "nginx:1.21.6"
    limits = {
      cpu    = "0.5"
      memory = "512Mi"
    }
    requests = {
      cpu    = "250m"
      memory = "50Mi"
    }
    health_check = {
      path                  = "/"
      port                  = 80
      initial_delay_seconds = 3
      period_seconds        = 3
    }
  }
}
