module "mssql1" {
  source  = "terraform-google-modules/sql-db/google//modules/mssql"
  version = "~> 20.0"

  region = var.region

  name                 = var.sql_instance_name
  random_instance_name = var.random_instance_name
  project_id           = var.project_id

  database_version = var.database_version

  deletion_protection = var.sql_deletion_protection

  tier = var.sql_tier

  ip_configuration = {
    ipv4_enabled    = false
    private_network = var.sql_private_network_id
  }

  sql_server_audit_config = var.sql_server_audit_config
  enable_default_db       = false
  enable_default_user     = false

  depends_on = [
    google_service_networking_connection.vpc_connection,
  ]
}


resource "google_compute_global_address" "private_ip_alloc" {
  project       = var.project_id
  name          = "psa-${var.sql_instance_name}"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  address       = var.sql_private_ip_alloc
  prefix_length = 16
  network       = var.sql_private_network_id
}

resource "google_service_networking_connection" "vpc_connection" {
  network = var.sql_private_network_id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
    google_compute_global_address.private_ip_alloc.name,
  ]
  deletion_policy = "ABANDON"
}
