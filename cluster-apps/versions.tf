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
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }
  required_version = ">= 0.13"
}
