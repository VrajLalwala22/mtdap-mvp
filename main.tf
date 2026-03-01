terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "tenant" {
  source    = "./infra/modules/tenant"
  name      = var.name
}