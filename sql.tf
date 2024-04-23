module "sql" {
  source                  = "./modules/sql"
  project_id              = var.project_id
  region                  = var.region
  sql_instance_name       = var.sql_instance_name
  random_instance_name    = var.random_instance_name
  database_version        = var.database_version
  sql_deletion_protection = var.sql_deletion_protection
  sql_tier                = var.sql_tier
  sql_private_ip_alloc    = var.sql_private_ip_alloc
  sql_private_network_id  = module.gcp-network.network_id
}

