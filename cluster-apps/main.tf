data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
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
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  for_each   = var.k8_workload_identities
  name       = each.value.service_account_name
  namespace  = each.value.namespace
  project_id = var.project_id
  roles      = each.value.roles
}


module "k8s-deployment" {
  source        = "./modules/deployment"
  for_each      = var.k8_deployments
  k8_deployment = each.value
}
