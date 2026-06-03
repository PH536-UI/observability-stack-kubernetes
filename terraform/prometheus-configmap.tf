resource "kubernetes_config_map" "prometheus_config" {

  metadata {
    name      = "prometheus-config"
    namespace = kubernetes_namespace.observability.metadata[0].name
  }

  data = {
    "prometheus.yml" = <<-EOT
global:
  scrape_interval: 15s

scrape_configs:

- job_name: prometheus
  static_configs:
  - targets:
    - localhost:9090

- job_name: node-exporter
  static_configs:
  - targets:
    - node-exporter:9100
EOT
  }
}
