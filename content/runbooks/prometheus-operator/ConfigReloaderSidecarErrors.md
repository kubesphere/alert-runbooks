---
title: Config Reloader Sidecar Errors
weight: 20
---
# ConfigReloaderSidecarErrors

## Meaning

Alert fires when config-reloader sidecar has not successfully reload

## Impact

As a result, configuration for service running in the pod may be stale and cannot be updated anymore.

## Diagnosis

```console
$ kubectl get statefulset -n kubesphere-monitoring-system -o wide
NAME                      READY   AGE   CONTAINERS                   
alertmanager-main         3/3     20h   alertmanager,config-reloader  
prometheus-k8s            2/2     20h   prometheus,config-reloader    
thanos-ruler-kubesphere   2/2     20h   thanos-ruler,config-reloader
$ kubectl get pod -n kubesphere-monitoring-system

$ kubectl logs [pod] -c config-reloader -n kubesphere-monitoring-system
```

## Mitigation

If config-reloader cannot reload the configuration, you may need to check the container logs.