variable "cluster_name" {
  type        = string
  description = "The name of the cluster, unique within the project and location."
}

variable "cluster_location" {
  type        = string
  description = "(Optional) The location (region or zone) in which the cluster master will be created, as well as the default node location."
  default     = null
}

variable "node_pools" {
  description = "A list of objects to configure additional node pools."
  type = list(object({
    name     = string
    location = string
    autoscaling = object({
      min_node_count = number
      max_node_count = number
    })
    machine_type = string
  }))
}

variable "helm_tools" {
  description = "A list of objects to configure the tooling required by the cluster."
  type = list(object({
    name          = string
    repository    = string
    chart         = string
    chart_version = string
    namespace     = string
    values        = list(string)
  }))
}
