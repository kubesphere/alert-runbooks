
# KubeAPIDown

## 含义

Prometheus 无法访问 Kubernetes 的 APIServer。当这种情况持续超过15分钟时，触发告警。

## 影响

这是一个紧急的告警。集群的可用性变差，如果所有的 APIServer 实例不可达，集群可能将无法使用。

## 诊断

Prometheus UI 的 `/targets` 页展示了拉取指标的 targets，查看对应 targets，状态异常时，将显示具体的 Error 信息。  

然后确认 Kubernetes API 是否正常响应，以及相关的 pods 是否正常。

```shell
kubectl cluster-info

kubectl -n kube-system get pods -l component=kube-apiserver

kubectl -n kube-system logs -l component=kube-apiserver
```

> 消息详情/标签中包含涉及的 APIServer 实例信息，可针对性排查。

如果 pods 都正常，可能是 Prometheus 与 APIServer 之间存在网络问题：

- 检查节点网络配置和防火墙
- 检查 kube-proxy 日志
- 检查 NetworkPolicies 配置，确认 Prometheus 与 APIServer 之间的流量是否被滤掉。

## 缓解

如果您仍能间歇性地访问 APIServer，那么您可以像处理其他失败的工作负载那样处理此问题。如果不行，请联系相关支持人员。