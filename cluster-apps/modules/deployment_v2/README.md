<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.this](https://registry.terraform.io/providers/hashicorp/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_file_documents.this](https://registry.terraform.io/providers/hashicorp/kubectl/latest/docs/data-sources/file_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8_deployment_yaml"></a> [k8\_deployment\_yaml](#input\_k8\_deployment\_yaml) | path to the k8 deployment yaml | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->