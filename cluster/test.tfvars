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

gke_node_pools = [
  {
    name         = "pool-01"
    min_count    = 1
    max_count    = 2
    machine_type = "n1-standard-1"
    disk_size_gb = 30
    disk_type    = "pd-standard"
    auto_upgrade = true
  }
]

sql_enabled = false

sql_instance_name = "test-sql"

random_instance_name = true

sql_private_ip_alloc = "10.92.0.0"

artifact_registry_name = "gke-test-reg"


kms_key_ring = "test-key-ring"

kms_key_ring_encrypter_and_decrypter_iam_members = ["user:magustin0329@gmail.com"]

kms_keys = {
  dotnet6 = {
    rotation_period = "7776000s"
    members         = ["user:magustin0329@gmail.com"]
  }
}
