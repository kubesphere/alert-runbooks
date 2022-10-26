---
title: Kube Aggregated API Down
weight: 20
---

# KubeAggregatedAPIDown

## Meaning

Kubernetes aggregated API has reported errors.
It has been under 85% available averaged over the last 10m.

## Impact

From minor such as inability to see cluster metrics to more severe such as
unable to use custom metrics to scale or even unable to use cluster.

## Diagnosis

The notification details should list the Apiservice name that's down. For Example:

```txt
 - alertname = KubeAggregatedAPIDown
...
 - name = v1beta1.metrics.k8s.io
...
```

Check the status of Apiservice and for recent events on `Apiservice` objects, 
and the status of the service specified in `spec` field:

```shell
kubectl describe apiservice <apiservice name>
```

## Mitigation

See [APIServer aggregation](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)