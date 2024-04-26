locals {
  subnet_names = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"
  version = "~> 30.0"

  project_id                 = var.project_id
  name                       = var.gke_cluster_name
  regional                   = var.gke_regional_deployment
  region                     = var.region
  network                    = module.gcp-network.network_name
  subnetwork                 = local.subnet_names[index(module.gcp-network.subnets_names, var.gke_subnetwork.name)]
  ip_range_pods              = var.gke_pod_range.name
  ip_range_services          = var.gke_svc_range.name
  master_ipv4_cidr_block     = var.gke_master_ipv4_cidr_block
  add_cluster_firewall_rules = true
  firewall_inbound_ports     = flatten([["9443", "15017"], var.gke_firewall_inbound_ports])
  kubernetes_version         = var.kubernetes_version
  deletion_protection        = var.gke_deletion_protection

  master_authorized_networks = flatten([[
    {
      cidr_block   = var.gke_master_auth_subnetwork.cidr
      display_name = var.gke_master_auth_subnetwork.name
    },
    ], var.authorized_networks

  ])

  notification_config_topic = google_pubsub_topic.updates.id
}

resource "google_pubsub_topic" "updates" {
  name    = "cluster-updates-${var.gke_cluster_name}"
  project = var.project_id
}

module "artifact_registry" {
  source        = "GoogleCloudPlatform/artifact-registry/google"
  version       = "~> 0.1"
  count         = length(var.artifact_registry_name) >= 1 ? 1 : 0
  project_id    = var.project_id
  location      = var.region
  format        = "DOCKER"
  repository_id = var.artifact_registry_name
}
