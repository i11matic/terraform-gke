terraform {
  backend "gcs" {
    bucket = "tf-state-gke-test"
    prefix = "terraform/cloud_build/state"
  }
}
