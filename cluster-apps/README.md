<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.25.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.13.1 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.2 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.25.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_k8-workload-identity"></a> [k8-workload-identity](#module\_k8-workload-identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | n/a |
| <a name="module_k8s-deployment"></a> [k8s-deployment](#module\_k8s-deployment) | ./modules/deployment | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | name of the gke cluster | `string` | n/a | yes |
| <a name="input_k8_deployments"></a> [k8\_deployments](#input\_k8\_deployments) | map of k8 deployment objects | <pre>map(object({<br>    namespace    = string<br>    labels       = map(string)<br>    annotations  = map(string)<br>    name         = string<br>    replicas     = number<br>    match_labels = map(string)<br>    env          = map(string)<br>    image_name   = string<br>    limits = object({<br>      cpu    = string<br>      memory = string<br>    })<br>    requests = object({<br>      cpu    = string<br>      memory = string<br>    })<br>    health_check = object({<br>      path                  = string<br>      port                  = number<br>      initial_delay_seconds = number<br>      period_seconds        = number<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_k8_namespaces"></a> [k8\_namespaces](#input\_k8\_namespaces) | map of namespace objects | <pre>map(object({<br>    labels      = map(string)<br>    annotations = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_k8_workload_identities"></a> [k8\_workload\_identities](#input\_k8\_workload\_identities) | n/a | <pre>map(object({<br>    service_account_name = string<br>    namespace            = string<br>    roles                = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->