resource "kubernetes_deployment" "grafana" {

  metadata {
    name      = "grafana"
    namespace = "observability"

    labels = {
      app = "grafana"
    }
  }

  spec {

    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {

      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {

        automount_service_account_token = false
        enable_service_links            = false

        container {

          name              = "grafana"
          image             = "grafana/grafana:latest"
          image_pull_policy = "Always"

        }
      }
    }
  }
}

resource "kubernetes_service" "grafana" {

  metadata {
    name      = "grafana"
    namespace = "observability"

    labels = {
      app = "grafana"
    }
  }

  spec {

    selector = {
      app = "grafana"
    }
    port {
      port        = 3000
      target_port = "3000"
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}
