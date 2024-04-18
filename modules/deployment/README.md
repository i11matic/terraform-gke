<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8_deployment"></a> [k8\_deployment](#input\_k8\_deployment) | n/a | <pre>object({<br>    namespace    = string<br>    labels       = map(string)<br>    annotations  = map(string)<br>    name         = string<br>    replicas     = number<br>    match_labels = map(string)<br>    env          = map(string)<br>    image_name   = string<br>    limits = object({<br>      cpu    = string<br>      memory = string<br>    })<br>    requests = object({<br>      cpu    = string<br>      memory = string<br>    })<br>    health_check = object({<br>      path                  = string<br>      port                  = number<br>      initial_delay_seconds = number<br>      period_seconds        = number<br>    })<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->