#!/bin/bash

mkdir -p exports

for resource in grafana prometheus loki node-exporter promtail
do
    kubectl get deployment $resource \
      -n observability \
      -o yaml > exports/${resource}-deployment.yaml 2>/dev/null

    kubectl get service $resource \
      -n observability \
      -o yaml > exports/${resource}-service.yaml 2>/dev/null
done
