resource "kubernetes_namespace_v1" "tenant" {
  metadata {
    name = var.name
  }
}

resource "kubernetes_deployment_v1" "nginx" {
  metadata {
    name      = "nginx"
    namespace = var.name
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}