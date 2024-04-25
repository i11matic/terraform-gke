data "google_client_config" "provider" {}

data "google_container_cluster" "cluster" {
  name     = var.gke_cluster_name
  location = "var.region"
}

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.cluster.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
    )
  }
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  version          = "v1.9.1"
  repository       = "https://charts.jetstack.io"
  create_namespace = true
  namespace        = "cert-manager"
  chart            = "jetstack/cert-manager"

  set {
    name  = "global.leaderElection.namespace"
    value = "cert-manager"
  }
  set {
    name  = "installCRDs"
    value = true
  }
}


data "http" "cloudSqlYaml" {
  url = "https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy-operator/v1.4.5/cloud-sql-proxy-operator.yaml"
}

resource "kubectl_manifest" "test" {
  yaml_body  = data.http.cloudSqlYaml.body
  depends_on = [helm_release.cert_manager]
}
