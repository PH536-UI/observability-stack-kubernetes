![Terraform](https://github.com/PH536-UI/observability-stack-kubernetes/actions/workflows/terraform.yml/badge.svg)# Kubernetes Observability Stack

Projeto de observabilidade executado localmente utilizando Kubernetes (Kind).

## Stack

- Kubernetes (Kind)
- Grafana
- Prometheus
- Loki
- Promtail
- Node Exporter

## Arquitetura

Logs:
Host -> Promtail -> Loki -> Grafana

Métricas:
Node Exporter -> Prometheus -> Grafana

## Tecnologias

- Docker
- Kubernetes
- PromQL
- LogQL
- Linux
- YAML

## Evidências

### Pods

![pods](screenshots/evidencia.png)

### Prometheus Targets

![targets](screenshots/evidencia4.png)

### Loki Logs

![loki](screenshots/evidencia7.png)

### Grafana Dashboard

![grafana](screenshots/evidencia10.png)

## Como executar

```bash
kubectl apply -f kubernetes/
```

## Aprendizados

- Troubleshooting Kubernetes
- Observabilidade moderna
- Monitoramento com Prometheus
- Centralização de logs com Loki
- Dashboards Grafana
