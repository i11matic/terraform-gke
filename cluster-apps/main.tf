data "google_client_config" "provider" {}

data "google_container_cluster" "cluster" {
  project  = var.project_id
  name     = var.gke_cluster_name
  location = var.region
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
  )
}

resource "kubernetes_namespace" "namespace" {
  for_each = var.k8_namespaces
  metadata {
    annotations = each.value.annotations
    labels      = each.value.labels
    name        = each.key
  }
}

module "k8-workload-identity" {
  source       = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  for_each     = var.k8_workload_identities
  cluster_name = var.gke_cluster_name
  location     = var.region
  name         = each.value.service_account_name
  namespace    = each.value.namespace
  project_id   = var.project_id
  roles        = each.value.roles
  depends_on   = [kubernetes_namespace.namespace]
}


module "k8s-deployment" {
  source        = "./modules/deployment"
  for_each      = var.k8_deployments
  k8_deployment = each.value
}
