<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_policy.crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_policy) | resource |
| [google_iam_policy.admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | Name of the kms key | `string` | n/a | yes |
| <a name="input_kms_key_encrypter_and_decrypter_iam_members"></a> [kms\_key\_encrypter\_and\_decrypter\_iam\_members](#input\_kms\_key\_encrypter\_and\_decrypter\_iam\_members) | list of IAM memvbers to grant access to the key | `list(string)` | n/a | yes |
| <a name="input_kms_key_ring_id"></a> [kms\_key\_ring\_id](#input\_kms\_key\_ring\_id) | key ring id | `string` | n/a | yes |
| <a name="input_kms_key_rotation"></a> [kms\_key\_rotation](#input\_kms\_key\_rotation) | rotation period in seconds. eg 86400s | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->