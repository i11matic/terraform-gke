terraform {
  backend "gcs" {
    bucket = "tf-state-gke-test"
    prefix = "terraform/cluster_apps/state"
  }
}
