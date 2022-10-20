---
title: Prometheus Operator Rejected Resources
weight: 20
---
# PrometheusOperatorRejectedResources

## Meaning

Alert fires when prometheus operator rejects the resource. 

## Impact

The prometheus operator rejects the resource, which may result in the inability to properly manage the resource status.

## Diagnosis

```console
$ kubectl get PrometheusRule -n kubesphere-monitoring-system
NAME                              AGE
alertmanager-main-rules           19h
kube-prometheus-rules             19h
kube-state-metrics-rules          19h
node-exporter-rules               19h
prometheus-k8s-etcd-rules         19h
prometheus-k8s-prometheus-rules   19h
prometheus-k8s-rules              19h
prometheus-operator-rules         19h
thanos-ruler-kubesphere-rules     19h
```
Number of resources managed by the operator's controller per state (selected/rejected).
```promql
prometheus_operator_managed_resources
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.