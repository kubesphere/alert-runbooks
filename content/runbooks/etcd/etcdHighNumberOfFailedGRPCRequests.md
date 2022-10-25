---
title: Etcd High Number Of Failed GRPC Requests
weight: 20
---

# etcdHighNumberOfFailedGRPCRequests

## Meaning

This alert fires when at least 5% of etcd gRPC requests failed in the past 10
minutes.

## Impact

First establish which gRPC method is failing, this will be visible in the alert.
If it's not part of the alert, the following query will display method and etcd
instance that has failing requests:

```promql
100 * sum without(grpc_type, grpc_code)
(rate(grpc_server_handled_total{grpc_code=~"Unknown|FailedPrecondition|ResourceExhausted|Internal|Unavailable|DataLoss|DeadlineExceeded",job="etcd"}[5m]))
/ sum without(grpc_type, grpc_code)
(rate(grpc_server_handled_total{job="etcd"}[5m])) > 5 and on()
(sum(cluster_infrastructure_provider{type!~"ipi|BareMetal"} == bool 1))
```

## Diagnosis

All the gRPC errors should also be logged in each respective etcd instance logs.
You can get the instance name from the alert that is firing or by running the
query detailed above. Those etcd instance logs should serve as further insight
into what is wrong.

Usually, in KubeSphere etcd is deployed on master nodes as a service of the master nodes, 
so login to the master node with the corresponding instance name, and check logs as follows:  

```shell
journalctl -u etcd --no-pager -f
```

## Mitigation

Depending on the above diagnosis, the issue will most likely be described in the
error log line of either etcd or openshift-etcd-operator. Most likely causes
tend to be networking issues.
