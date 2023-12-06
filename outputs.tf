output "cluster_id" {
  value       = module.google_container_cluster.cluster_id
  description = "An identifier for the resource with format projects/{{project}}/locations/{{zone}}/clusters/{{name}}"
}

output "helm_releases_info" {
  value       = values(module.cluster_tooling)[*]
  description = "A list of objects with information about the releases installed."
}