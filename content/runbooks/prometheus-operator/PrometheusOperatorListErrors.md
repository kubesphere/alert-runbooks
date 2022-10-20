---
title: Prometheus Operator List Errors
weight: 20
---
# PrometheusOperatorListErrors

## Meaning

Alert fires when prometheus operator fails to perform the list operation.

## Impact

The controller cannot perform the list operation, which may result in the inability to properly manage the resource status.

## Diagnosis    

```console
$ kubectl get pod -n kubesphere-monitoring-system | grep prometheus-operator

$ kubectl logs prometheus-operator-8598bf458d-t8b6t -n kubesphere-monitoring-system
```

### PromQL queries

Check the failed list operation with the following query in the
metrics console:

Total number of list operations that failed.
```promql
prometheus_operator_list_operations_failed_total
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.