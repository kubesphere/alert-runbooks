---
title: Kube State Metrics Sharding Mismatch
weight: 20
---


# KubeStateMetricsShardingMismatch

## Meaning

Alert fires when kube-state-metrics sharding is misconfigured. 

## Impact

The kube-state-metrics pods are running with different --total-shards configuration,
some Kubernetes objects may be exposed multiple times or not exposed at all.

## Diagnosis

Sharding should be used carefully and additional monitoring should be set up 
in order to ensure that sharding is set up and functioning as expected.

## Mitigation

The kube-state-metrics can be configured through [command line arguments](https://github.com/kubernetes/kube-state-metrics/blob/master/docs/cli-arguments.md).
