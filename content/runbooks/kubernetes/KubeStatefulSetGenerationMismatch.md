---
title: Kube StatefulSet Generation Mismatch
weight: 20
---


## KubeStatefulSetGenerationMismatch


## Meaning

There has been an attempted update to a statefulset, but it has failed, this indicates that the statefulset has failed but has not been rolled back.

## Impact

This means that statefulset is temporarily unable to provide the expected services to the public.

## Diagnosis

* Check the statefulset.
* Check the pod logs.
* Check the events.

## Mitigation

Check if the statefulset related configuration is correct and wait for the state rollback.