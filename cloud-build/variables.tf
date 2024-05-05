variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}

variable "cloud_connection_name" {
  type        = string
  description = "Name of the cloud build connection"
  default     = "github-connector"
}

variable "secret_name" {
  type        = string
  description = "Name of the secret to be created with the github token"
  default     = "github-token-secret"

}

variable "github_token" {
  type        = string
  description = "path to the github token file"

}

variable "app_installation_id" {
  type        = string
  description = "app installation id of cloud build app"

}
