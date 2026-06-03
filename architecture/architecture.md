# Observability Stack Architecture

                +-------------+
                |   Grafana   |
                +------+------+
                       |
             +---------+---------+
             |                   |
             v                   v
      +-------------+     +-------------+
      | Prometheus  |     |    Loki     |
      +------+------+     +------+------+
             ^                   ^
             |                   |
      +------+------+
      | Node Export |
      +-------------+

             ^
             |
      +-------------+
      |  Promtail   |
      +-------------+

Namespace: observability

Components:
- Grafana: Visualization
- Prometheus: Metrics
- Node Exporter: Host Metrics
- Loki: Log Aggregation
- Promtail: Log Collection