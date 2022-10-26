---
title: Kube Client Certificate Expiration
weight: 20
---

# KubeClientCertificateExpiration

## Meaning

A client certificate used to authenticate to the apiserver is expiring in less than 7 days (warning alert) or 24 hours (critical alert).

## Impact

Client will not be able to interact with the cluster.
In cluster services communicating with Kubernetes API may degrade or become unavailable.

## Diagnosis

Check when certificate was issued and when it expires.

> The [kubekey](https://github.com/kubesphere/kubekey.git) provides certificate expiration check and please refer to [here](https://github.com/kubesphere/kubekey/blob/master/docs/check-renew-certificate.md#check-certificate-expiration).  

Check serviceAccounts and service account tokens.

## Mitigation

Update client certificate.

> The [kubekey](https://github.com/kubesphere/kubekey.git) provides certificate refresh and please refer to [here](https://github.com/kubesphere/kubekey/blob/master/docs/check-renew-certificate.md#renew-certificate). 

For in-cluster clients recreate pods.
