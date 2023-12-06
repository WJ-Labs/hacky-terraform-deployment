module "gke_cluster" {
  source = "github.com/WJ-Labs/hacky-terraform-google-container-cluster.git"
}

module "helm_tools" {
  source = "github.com/WJ-Labs/hacky-terraform-helm-release.git"
}