---
title: Kube Controller Manager Down
weight: 20
---

# KubeControllerManagerDown

## Meaning

This alert is triggered when the monitoring system has not been able to reach
any of the cluster's kube-controller-manager for more than 15 minutes.

## Impact

The cluster is not functional and Kubernetes resources cannot be reconciled.  

<details>
<summary>Full context</summary>

More about kube-controller-manager function can be found at https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/

</details>

## Diagnosis

Check the status of the kube-controller-manager targets in the Prometheus UI 
to confirm whether there is a network issue between the
Prometheus instances and the kube controller manager pods.

Check the status and logs of the kube-controller-manager pods.  

```shell
$ kubectl -n kube-system get pods
$ kubectl -n kube-system logs -l 'component=kube-controller-manager'
```

## Mitigation

TODO
