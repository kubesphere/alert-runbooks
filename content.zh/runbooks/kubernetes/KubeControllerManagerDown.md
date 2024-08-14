
# KubeControllerManagerDown

## 含义

Prometheus 无法访问 kube-controller-manager 的实例。

## 影响

集群功能可能受到影响，resources 可能不能被 reconciled，特别是 kube-controller-manager 所有实例都出现问题时。

## 诊断

Prometheus UI 的 `/targets` 页展示了拉取指标的 targets，查看对应 targets，状态异常时，将显示具体的 Error 信息。  

检查相关的 pods 是否正常。

```shell
kubectl -n kube-system get pods -l component=kube-controller-manager

kubectl -n kube-system logs -l component=kube-controller-manager
```

> 消息详情/标签中包含涉及的 kube-controller-manager 实例信息，可针对性排查。

如果 pods 都正常，可能是 Prometheus 与 kube-controller-manager 之间存在网络问题：

- 检查节点网络配置和防火墙
- 检查 kube-proxy 日志
- 检查 NetworkPolicies 配置，确认 Prometheus 与 kube-controller-manager 之间的流量是否被滤掉。