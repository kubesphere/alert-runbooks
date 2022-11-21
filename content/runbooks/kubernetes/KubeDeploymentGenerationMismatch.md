---
title: Kube Deployment Generation Mismatch
weight: 20
---


## KubeDeploymentGenerationMismatch

## Meaning

There has been an attempted update to a deployment, but it has failed, this indicates that the deployment has failed but has not been rolled back.

## Impact

This means that deployment is temporarily unable to provide the expected services to the public.

## Diagnosis

* Check the deployment.
* Check the pod logs.
* Check the events.

## Mitigation

Check if the deployment related configuration is correct and wait for the deployment rollback.
