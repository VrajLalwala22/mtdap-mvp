resource "kubernetes_namespace_v1" "tenant" {
  metadata {
    name = var.name
  }
}