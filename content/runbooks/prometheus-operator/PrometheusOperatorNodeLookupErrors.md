---
title: Prometheus Operator Node Lookup Errors
weight: 20
---
# PrometheusOperatorNodeLookupErrors

## Meaning

Alert fires when number of times a node IP address could not be determined.

## Impact

The Prometheus Operator is unable to determine the IP address of a node.
The state of resources managed by the prometheus operator cannot be effectively updated.

## Diagnosis


```console
$ kubectl get pod -n kubesphere-monitoring-system | grep prometheus-operator
prometheus-operator-8598bf458d-t8b6t               2/2     Running   0                  3d18
$ kubectl logs prometheus-operator-8598bf458d-t8b6t -n kubesphere-monitoring-system
```

## Mitigation

The internal error of prometheus operator needs to be analyzed according to the pod logs.