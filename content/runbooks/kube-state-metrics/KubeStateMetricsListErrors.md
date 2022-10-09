---
title: Kube State Metrics List Errors
weight: 20
---

# KubeStateMetricsListErrors

## Meaning

Alert fires when kube-state-metrics is experiencing errors in list operations.

## Impact

The kube-state-metrics is experiencing errors at an elevated rate in list operations. 
This is likely causing it to not be able to expose metrics about Kubernetes objects correctly or at all.

## Diagnosis

```console
$ kubectl get pod -n kubesphere-monitoring-system | grep kube-state-metrics
kube-state-metrics-59d8598cd-zhhqn                 3/3     Running   5 (3h10m ago)     20h
$ kubectl logs kube-state-metrics-59d8598cd-zhhqn -c kube-state-metrics -n kubesphere-monitoring-system
```
## Mitigation

Check the resources monitored by kube-state-metrics and analyze the log information of kube-state-metrics pods.