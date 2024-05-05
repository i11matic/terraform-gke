data "google_project" "project" {
  project_id = var.project_id
}


resource "google_secret_manager_secret" "github-token-secret" {
  project   = var.project_id
  secret_id = var.secret_name

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "github-token-secret-version" {
  secret      = google_secret_manager_secret.github-token-secret.id
  secret_data = file(var.github_token)
}



resource "google_secret_manager_secret_iam_binding" "binding" {
  project   = var.project_id
  secret_id = google_secret_manager_secret.github-token-secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members   = ["serviceAccount:service-${data.google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
}

resource "google_cloudbuildv2_connection" "gh-connection" {
  project  = var.project_id
  location = var.region
  name     = var.cloud_connection_name

  github_config {
    app_installation_id = var.app_installation_id
    authorizer_credential {
      oauth_token_secret_version = google_secret_manager_secret_version.github-token-secret-version.id
    }
  }
}
