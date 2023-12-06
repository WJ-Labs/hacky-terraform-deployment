module "google_container_cluster" {
  source = "github.com/WJ-Labs/hacky-terraform-google-container-cluster.git"

  project_id = data.google_project.this.project_id

  cluster_location = var.cluster_location
  cluster_name     = var.cluster_name

  node_pools = var.node_pools
}

module "cluster_tooling" {
  source   = "github.com/WJ-Labs/hacky-terraform-helm-release.git"
  for_each = { for helm_release in var.helm_tools : helm_release.name => helm_release }

  name       = each.value.name
  repository = each.value.repository

  chart         = each.value.chart
  chart_version = each.value.chart_version

  namespace = each.value.namespace

  values = [ for value in each.value.values: "${path.module}/${file(value)}"]

  depends_on = [
    module.google_container_cluster
  ]
}