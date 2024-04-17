locals {
  subnet_names = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 7.5"

  project_id   = var.project_id
  network_name = var.gke_network_name

  subnets = [
    {
      subnet_name   = var.gke_subnetwork.name
      subnet_ip     = var.gke_subnetwork.cidr
      subnet_region = var.region
    },
    {
      subnet_name   = var.gke_master_auth_subnetwork.name
      subnet_ip     = var.gke_master_auth_subnetwork.cidr
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (var.gke_subnetwork.name) = [
      {
        range_name    = var.gke_pod_range.name
        ip_cidr_range = var.gke_pod_range.cidr
      },
      {
        range_name    = var.gke_svc_range.name
        ip_cidr_range = var.gke_svc_range.cidr
      },
    ]
  }
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
  firewall_inbound_ports     = flatten([["9443", "15017"], [var.gke_firewall_inbound_ports]])
  kubernetes_version         = var.kubernetes_version
  deletion_protection        = var.gke_deletion_protection

  master_authorized_networks = [
    {
      cidr_block   = var.gke_master_auth_subnetwork.cidr
      display_name = var.gke_master_auth_subnetwork.name
    },
  ]

  notification_config_topic = google_pubsub_topic.updates.id
}

resource "google_pubsub_topic" "updates" {
  name    = "cluster-updates-${var.gke_cluster_name}"
  project = var.project_id
}
