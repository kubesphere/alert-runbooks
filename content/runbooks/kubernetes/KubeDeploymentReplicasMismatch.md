---
title: Kube Deployment Replicas Mismatch
weight: 20
---

## KubeDeploymentReplicasMismatch


## Meaning

This alert is triggered when deployment has not matched the expected number of replicas for more than 15 minutes.


## Impact

This means that deployment is temporarily unable to provide the expected services to the public.

## Diagnosis

In high availability clusters with multiple replicas, this alert fires when the number of replicas is not optimal.

Check the status of the deployment:
```console
$ kubectl get deployment $DEPLOYMENT_NAME -n $NAMESPACE
```

## Mitigation

This may occur when there are not enough resources in the cluster to schedule.
Check resource utilization, and add capacity as necessary.