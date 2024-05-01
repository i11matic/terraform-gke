<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudbuildv2_connection.gh-connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection) | resource |
| [google_secret_manager_secret.github-token-secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_binding.binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_binding) | resource |
| [google_secret_manager_secret_version.github-token-secret-version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_installation_id"></a> [app\_installation\_id](#input\_app\_installation\_id) | app installation id of cloud build app | `string` | n/a | yes |
| <a name="input_cloud_connection_name"></a> [cloud\_connection\_name](#input\_cloud\_connection\_name) | Name of the cloud build connection | `string` | `"github-connector"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | path to the github token file | `string` | `"./files/github_token.txt"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret to be created with the github token | `string` | `"github-token-secret"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->