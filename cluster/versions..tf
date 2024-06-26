terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.25.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.29.0"
    }
  }
  required_version = ">= 0.13"
}
