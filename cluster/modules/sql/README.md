<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mssql1"></a> [mssql1](#module\_mssql1) | terraform-google-modules/sql-db/google//modules/mssql | ~> 20.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.private_ip_alloc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_service_networking_connection.vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | database version for ms sql | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_random_instance_name"></a> [random\_instance\_name](#input\_random\_instance\_name) | enable random instance name | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |
| <a name="input_sql_deletion_protection"></a> [sql\_deletion\_protection](#input\_sql\_deletion\_protection) | enable delete protection | `bool` | n/a | yes |
| <a name="input_sql_instance_name"></a> [sql\_instance\_name](#input\_sql\_instance\_name) | name of the sql instance | `string` | n/a | yes |
| <a name="input_sql_private_ip_alloc"></a> [sql\_private\_ip\_alloc](#input\_sql\_private\_ip\_alloc) | private network address | `string` | n/a | yes |
| <a name="input_sql_private_network_id"></a> [sql\_private\_network\_id](#input\_sql\_private\_network\_id) | private network id | `string` | n/a | yes |
| <a name="input_sql_server_audit_config"></a> [sql\_server\_audit\_config](#input\_sql\_server\_audit\_config) | SQL server audit config settings. | `map(string)` | `{}` | no |
| <a name="input_sql_tier"></a> [sql\_tier](#input\_sql\_tier) | tier for the sql instance | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->