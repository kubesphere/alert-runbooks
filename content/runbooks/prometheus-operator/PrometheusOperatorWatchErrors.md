---
title: Prometheus Operator Watch Errors
weight: 20
---
# PrometheusOperatorWatchErrors

## Meaning

Alert fires when the prometheus operator fails to perform the watch operation

## Impact

May cause the prometheus operator to not be able to accurately control the resource.

## Diagnosis

```console
$ kubectl get pod -n kubesphere-monitoring-system | grep prometheus-operator
prometheus-operator-8598bf458d-t8b6t               2/2     Running   0                  3d18h
$ kubectl logs prometheus-operator-8598bf458d-t8b6t -n kubesphere-monitoring-system
```

Check the failed watch operation with the following query in the
metrics console:

Total number of watch operations that failed.
```promql
prometheus_operator_watch_operations_failed_total
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.