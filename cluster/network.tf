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

resource "google_compute_router" "router" {
  name    = var.router_name
  project = var.project_id
  region  = var.region
  network = module.gcp-network.network_id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.router_name}-nat"
  project                            = var.project_id
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
