---
title: Prometheus Operator Not Ready
weight: 20
---
# PrometheusOperatorNotReady

## Meaning

PrometheusOperatorNotReady alert is fired when a prometheus operator is not in Ready state for a certain period.

## Impact

If the prometheus operator cannot reach the ready state for a long time, it needs to be checked for errors.

## Diagnosis

```console
$ kubectl get deployment -n kubesphere-monitoring-system | grep prometheus-operator
NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
prometheus-operator               1/1     1            1           80m
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.