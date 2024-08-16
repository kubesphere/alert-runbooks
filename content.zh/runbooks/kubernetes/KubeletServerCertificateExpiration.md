
# KubeletServerCertificateExpiration

## 含义

节点上 Kubelet server 证书即将过期或已经过期。

## 影响

节点将无法在集群内使用。

## 诊断

> 消息详情/标签中包含 Node 信息。

检查节点上的 Kubelet server 证书是什么时候发布的以及什么时候过期。

## 缓解

更新节点上的证书。  

使用 [KubeKey](https://github.com/kubesphere/kubekey/blob/master/docs/check-renew-certificate.md) 或 [kubeadm](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubeadm/kubeadm-certs) 等工具检查和更新集群内由 kubeadm 管理的证书。(使用其他工具创建的集群请参考工具的对应文档)