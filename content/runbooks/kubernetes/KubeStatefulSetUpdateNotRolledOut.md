---
title: Kube StatefulSet Update Not Rolled Out
weight: 20
---


## KubeStatefulSetUpdateNotRolledOut

## Meaning

This alert is triggered when a statefulset update has not been rolled out for more than 15 minutes.

## Impact

This indicates an update to a statefulset has failed.

## Diagnosis

Check statefulset.
```console
$ kubectl get statefulset -n $NAMESPACE
```

Check logs.
```console
kubectl logs $POD -n $NAMESPACE
```

## Mitigation
Check various configurations, if correct, please wait.