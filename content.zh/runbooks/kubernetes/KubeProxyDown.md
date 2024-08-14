---
title: KubeProxy Down
---

# KubeProxyDown

## 含义

Prometheus 无法访问 Kubernetes 的 kube-proxy。当这种情况持续超过15分钟时，触发告警。

## 影响

kube-proxy 是一个在集群中的每个节点上运行的网络代理，它实现了 Kubernetes Service 的一部分。

kube-proxy 维护节点上的网络规则。这些网络规则允许从集群内部或外部的网络会话与节点上的 Pods 进行网络通信。

如果有操作系统数据包过滤层并且可用，kube-proxy 会使用该层。否则，kube-proxy 会自行转发流量。

## 诊断

> 消息详情/标签中包含 Node 信息。

Prometheus UI 的 `/targets` 页展示了拉取指标的 targets，查看对应 targets，状态异常时，将显示具体的 Error 信息。  

kube-proxy 在 Kubernetes 上以 DaemonSet 方式部署在 kube-system 下。  

- 检查 kube-proxy 的状态，确保它们正常运行：`kubectl get pods -l k8s-app=kube-proxy -n kube-system`。
- 检查对应节点上 kube-proxy Pod 的日志是否存在错误信息或异常情况：`kubectl logs -n kube-system kube-proxy-xxxxx`。
- 检查节点状态是否就绪：`kubectl describe node $NODE_NAME`。
- 检查网络配置，特别是防火墙和网络策略配置，确保 kube-proxy 能够正常与 APIServer 和其他服务正常通信。

## 缓解

如果上述检查未发现问题，可尝试重启节点上的 kube-proxy Pod：`kubectl -n kube-system delete pod kube-proxy-xxxxx`。
