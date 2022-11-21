---
title: Kube StatefulSet Replicas Mismatch
weight: 20
---


## KubeStatefulSetReplicasMismatch

## Meaning

In high availability clusters with multiple replicas, this alert fires when the number of replicas is not optimal. 

## Impact

Increased access to other available replicas.

## Diagnosis

This may occur when there are not enough resources in the cluster to schedule.

## Mitigation

Check resource utilization, and add capacity as necessary.