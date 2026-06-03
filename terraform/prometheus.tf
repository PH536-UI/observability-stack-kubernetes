resource "kubernetes_deployment" "prometheus" {

  metadata {
    name      = "prometheus"
    namespace = "observability"

    labels = {
      app = "prometheus"
    }
  }

  spec {

    replicas = 1

    selector {
      match_labels = {
        app = "prometheus"
      }
    }

    template {

      metadata {
        labels = {
          app = "prometheus"
        }
      }

      spec {

        container {

          name  = "prometheus"
          image = "prom/prometheus:v3.4.1"

          image_pull_policy = "IfNotPresent"

          args = [
            "--config.file=/etc/prometheus/prometheus.yml",
            "--storage.tsdb.path=/prometheus"
          ]

          port {
            container_port = 9090
          }

          volume_mount {
            name       = "prometheus-config"
            mount_path = "/etc/prometheus"
          }

          volume_mount {
            name       = "prometheus-storage"
            mount_path = "/prometheus"
          }
        }

        volume {
          name = "prometheus-config"

          config_map {
            name = "prometheus-config"
          }
        }

        volume {
          name = "prometheus-storage"

          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_service" "prometheus" {

  metadata {
    name      = "prometheus"
    namespace = "observability"

    labels = {
      app = "prometheus"
    }
  }

  spec {

    selector = {
      app = "prometheus"
    }

    port {
      port        = 9090
      target_port = 9090
    }

    type = "ClusterIP"
  }
}
