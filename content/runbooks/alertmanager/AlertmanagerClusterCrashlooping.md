---
title: Alertmanager Cluster Crashlooping
weight: 20
---

# AlertmanagerClusterCrashlooping

## Meaning

Half or more of the Alertmanager instances within the same cluster are crashlooping.

## Impact

Alerts could be notified multiple time unless pods are crashing to fast and no alerts can be sent.

## Diagnosis

```bash
$ kubectl -n kubesphere-monitoring-system get pod -l app.kubernetes.io/name=alertmanager

NAMESPACE                        NAME                    READY   STATUS              RESTARTS    AGE
kubesphere-monitoring-system     alertmanager-main-0     1/2     CrashLoopBackOff    37107       2d
kubesphere-monitoring-system     alertmanager-main-1     2/2     Running             0 43d
kubesphere-monitoring-system     alertmanager-main-2     2/2     Running             0 43d 
```

Find the root cause by looking to events for a given pod/deployement

```
$ kubectl -n kubesphere-monitoring-system get events --field-selector involvedObject.name=alertmanager-main-0
```

## Mitigation

Make sure pods have enough resources (CPU, MEM) to work correctly.
