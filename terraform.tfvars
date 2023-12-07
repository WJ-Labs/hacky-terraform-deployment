cluster_name     = "hacky-cluster"
cluster_location = "us-west1-a"

node_pools = [
  {
    name     = "hacky-node-pool1"
    location = "us-west1-a"
    autoscaling = {
      min_node_count = 1
      max_node_count = 5
    }
    machine_type = "n1-standard-8"
  }
]

helm_tools = [
  {
    name          = "hacky-consul"
    repository    = "https://helm.releases.hashicorp.com"
    chart         = "consul"
    chart_version = "1.3.0"
    namespace     = "consul"
    values = [
      "helm/values/consul.yaml"
    ]
  },
  {
    name          = "hacky-argocd"
    repository    = "https://argoproj.github.io/argo-helm"
    chart         = "argo-cd"
    chart_version = "5.35.0"
    namespace     = "argocd"
    values = [
      "helm/values/argocd.yaml"
    ]
  },
  {
    name          = "hacky-certmanager"
    repository    = "https://charts.jetstack.io"
    chart         = "cert-manager"
    chart_version = "v1.13.2"
    namespace     = "certmanager"
    values = [
      "helm/values/certmanager.yaml"
    ]
  }
]
