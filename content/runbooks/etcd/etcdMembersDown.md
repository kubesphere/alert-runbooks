---
title: Etcd Members Down
weight: 20
---

# etcdMembersDown

## Meaning

This alert fires when one or more etcd member goes down and evaluates the
number of etcd members that are currently down. Often, this alert was observed
as part of a cluster upgrade when a master node is being upgraded and requires a
reboot.

## Impact

In etcd a majority of (n/2)+1 has to agree on membership changes or key-value
upgrade proposals. With this approach, a split-brain inconsistency can be
avoided. In the case that only one member is down in a 3-member cluster, it
still can make forward progress. Due to the fact that the quorum is 2 and 2
members are still alive. However, when more members are down, the cluster
becomes unrecoverable.

## Diagnosis

Login to the cluster. Check health of master nodes if any of them is in
`NotReady` state or not.

```shell
$ kubectl get nodes -l node-role.kubernetes.io/master=
```

### General etcd health

Login to one of the master nodes to validate that the `etcdctl` command is available:

```shell
$ etcdctl version
```

Run the following command to get the health of etcd:

```shell
$ etcdctl endpoint health -w table
```

> TLS args may be added for secure etcd. eg: `--cacert /etc/ssl/etcd/ssl/ca.pem --cert /etc/ssl/etcd/ssl/node-$(hostname).pem --key /etc/ssl/etcd/ssl/node-$(hostname)-key.pem`

## Mitigation

If an upgrade is in progress, the alert may automatically resolve in some time
when the master node is up and running again. 

In the case when you are running on AWS, the AWS instance retirement might need
a manual reboot of the master node.
