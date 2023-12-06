<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.8 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_tooling"></a> [cluster\_tooling](#module\_cluster\_tooling) | github.com/WJ-Labs/hacky-terraform-helm-release.git | n/a |
| <a name="module_google_container_cluster"></a> [google\_container\_cluster](#module\_google\_container\_cluster) | github.com/WJ-Labs/hacky-terraform-google-container-cluster.git | n/a |

## Resources

| Name | Type |
|------|------|
| [google_client_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | (Optional) The location (region or zone) in which the cluster master will be created, as well as the default node location. | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster, unique within the project and location. | `string` | n/a | yes |
| <a name="input_helm_tools"></a> [helm\_tools](#input\_helm\_tools) | A list of objects to configure the tooling required by the cluster. | <pre>list(object({<br>    name          = string<br>    repository    = string<br>    chart         = string<br>    chart_version = string<br>    namespace     = string<br>    values        = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | A list of objects to configure additional node pools. | <pre>list(object({<br>    name     = string<br>    location = string<br>    autoscaling = object({<br>      min_node_count = number<br>      max_node_count = number<br>    })<br>    machine_type = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | An identifier for the resource with format projects/{{project}}/locations/{{zone}}/clusters/{{name}} |
| <a name="output_helm_releases_info"></a> [helm\_releases\_info](#output\_helm\_releases\_info) | A list of objects with information about the releases installed. |
<!-- END_TF_DOCS -->