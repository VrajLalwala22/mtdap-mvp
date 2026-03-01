terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  host                   = var.kube_host
  client_certificate     = base64decode(var.kube_client_certificate)
  client_key             = base64decode(var.kube_client_key)
  cluster_ca_certificate = base64decode(var.kube_cluster_ca_certificate)
}

locals {
  tenant_files = fileset("${path.module}/tenants", "*.tfvars")

  tenants = {
    for file in local.tenant_files :
    trimsuffix(file, ".tfvars") => trimsuffix(file, ".tfvars")
  }
}

module "tenant" {
  for_each = local.tenants
  source   = "./infra/modules/tenant"
  name     = each.value
}