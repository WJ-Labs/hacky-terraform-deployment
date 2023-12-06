terraform {
  required_version = "~> 1.6"
  required_providers {
    helm   = "~> 2.12"
    google = "~> 5.8"
  }
  backend "gcs" {
    bucket = "wjlabs_terraform_deployment"
    prefix = "terraform/hacky/deployment"
  }
}

provider "google" {
  project = "wj-labs-407316"
  region  = "us-west1"
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.google_container_cluster.cluster_endpoint}"
    token                  = data.google_client_config.this.access_token
    cluster_ca_certificate = module.google_container_cluster.cluster_ca_certificate
  }
}
