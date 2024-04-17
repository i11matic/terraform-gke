# terraform-gke
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.25.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.25.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-network"></a> [gcp-network](#module\_gcp-network) | terraform-google-modules/network/google | >= 7.5 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/safer-cluster | ~> 30.0 |
| <a name="module_project-services"></a> [project-services](#module\_project-services) | terraform-google-modules/project-factory/google//modules/project_services | ~> 14.5 |

## Resources

| Name | Type |
|------|------|
| [google_pubsub_topic.updates](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_activate_apis"></a> [gcp\_activate\_apis](#input\_gcp\_activate\_apis) | list of services to enable | `list(string)` | `[]` | no |
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | name of the gke cluster | `string` | n/a | yes |
| <a name="input_gke_deletion_protection"></a> [gke\_deletion\_protection](#input\_gke\_deletion\_protection) | enable delete protection | `bool` | `false` | no |
| <a name="input_gke_firewall_inbound_ports"></a> [gke\_firewall\_inbound\_ports](#input\_gke\_firewall\_inbound\_ports) | list of inbound firewall ports | `list(string)` | `[]` | no |
| <a name="input_gke_master_auth_subnetwork"></a> [gke\_master\_auth\_subnetwork](#input\_gke\_master\_auth\_subnetwork) | Configuration of gke master authorized network | <pre>object({<br>    name = string<br>    cidr = string<br>  })</pre> | n/a | yes |
| <a name="input_gke_master_ipv4_cidr_block"></a> [gke\_master\_ipv4\_cidr\_block](#input\_gke\_master\_ipv4\_cidr\_block) | cidr block for the master k8s api | `string` | n/a | yes |
| <a name="input_gke_network_name"></a> [gke\_network\_name](#input\_gke\_network\_name) | Name of the network | `string` | n/a | yes |
| <a name="input_gke_pod_range"></a> [gke\_pod\_range](#input\_gke\_pod\_range) | Configuration of the gke pod range | <pre>object({<br>    name = string<br>    cidr = string<br>  })</pre> | n/a | yes |
| <a name="input_gke_regional_deployment"></a> [gke\_regional\_deployment](#input\_gke\_regional\_deployment) | enable regional | `bool` | `true` | no |
| <a name="input_gke_subnetwork"></a> [gke\_subnetwork](#input\_gke\_subnetwork) | Configuration for  gke subnetwork | <pre>object({<br>    name = string<br>    cidr = string<br>  })</pre> | n/a | yes |
| <a name="input_gke_svc_range"></a> [gke\_svc\_range](#input\_gke\_svc\_range) | Configuration of the gke svc range | <pre>object({<br>    name = string<br>    cidr = string<br>  })</pre> | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | kuberentes version | `string` | `"latest"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->