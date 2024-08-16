
# KubeletDown

## 含义

Prometheus 无法访问 Kubernetes 的 kubelet。当这种情况持续超过15分钟时，触发告警。

## 影响

这是一个紧急的告警。集群的可用性变差，相关的节点可能无法在集群内使用。

## 诊断

> 消息详情/标签中包含 Node 信息。

Prometheus UI 的 `/targets` 页展示了拉取指标的 targets，查看对应 targets，状态异常时，将显示具体的 Error 信息。  

然后检查节点状态，以及与节点相关的 events。

```shell
kubectl get nodes

kubectl describe node $NODE_NAME

kubectl get events --field-selector 'involvedObject.kind=Node'
```

如果可以 SSH 访问节点，可以直接检查 Kubelet 的日志。

```shell
journalctl -b -f -u kubelet.service
```

## 缓解

具体的缓解措施取决于导致 Kubelet 无响应的原因。检查网络是否存在问题，以及配置是否存在问题。
