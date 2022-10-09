---
title: Kube State Metrics Shards Missing
weight: 20
---


# KubeStateMetricsShardsMissing

## Meaning

Alert fires when kube-state-metrics shards are missing.

## Impact

The kube-state-metrics shards are missing, some Kubernetes objects are not being exposed.

## Diagnosis

By default, kube-state-metrics exposes several metrics for events across your cluster.
Please take a moment to configure what metrics you'd like to expose, as well as consult the documentation for your Kubernetes environment.

## Mitigation

The kube-state-metrics can be configured through [command line arguments]([]https://github.com/kubernetes/kube-state-metrics/blob/master/docs/cli-arguments.md).
