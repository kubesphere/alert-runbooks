---
title: Prometheus Operator Sync Failed
weight: 20
---
# PrometheusOperatorSyncFailed

## Meaning

Alert fires when prometheus operator fails to perform the sync operation.

## Impact

The state of resources managed by the prometheus operator cannot be effectively updated.

## Diagnosis

```console
$ kubectl get deploy -n kubesphere-monitoring-system
NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
grafana                           1/1     1            1           3d18h
kube-state-metrics                1/1     1            1           3d18h
notification-manager-deployment   2/2     2            2           18d
notification-manager-operator     1/1     1            1           18d
prometheus-operator               1/1     1            1           3d18h
$ kubectl get pod -n kubesphere-monitoring-system | grep prometheus-operator
prometheus-operator-8598bf458d-t8b6t               2/2     Running   0                  3d18
$ kubectl logs prometheus-operator-8598bf458d-t8b6t -n kubesphere-monitoring-system
```

### PromQL queries

Check the failed sync operation with the following query in the
metrics console:

Number of node endpoints synchronisation failures.
```promql
prometheus_operator_node_syncs_failed_total
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.