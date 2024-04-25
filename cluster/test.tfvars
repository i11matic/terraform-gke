project_id = "gke-test-420601"

region = "northamerica-northeast1"

router_name = "gke-router"

gke_network_name = "gke-test-3"

gke_subnetwork = {
  name = "gke-subnet"
  cidr = "10.91.0.0/17"
}

gke_master_auth_subnetwork = {
  name = "gke-master-auth-subnet"
  cidr = "10.101.0.0/17"
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

sql_enabled = true

sql_instance_name = "test-sql"

random_instance_name = true

sql_private_ip_alloc = "10.92.0.0"
