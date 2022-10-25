---
title: Prometheus Operator Reconcile Errors
weight: 20
---
# PrometheusOperatorReconcileErrors

## Meaning

Alert fires when prometheus operator reconciling operations failed.

## Impact

May cause the state of resources managed by the prometheus operator not to be updated.

## Diagnosis

```console
$ kubectl get pod -n kubesphere-monitoring-system | grep prometheus-operator
prometheus-operator-8598bf458d-t8b6t               2/2     Running   0                  3d18h
$ kubectl logs prometheus-operator-8598bf458d-t8b6t -n kubesphere-monitoring-system
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.