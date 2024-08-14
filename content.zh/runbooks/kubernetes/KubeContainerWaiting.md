
# KubeContainerWaiting

## 含义

Container 处于 Waiting 状态时间过长。持续超过1小时将触发告警。

## 影响

服务性能下降，甚至不可用。

## 诊断

> 消息详情/标签中包含 Pod, Container, Namespace 信息。

- 检查 Pod events: `kubectl -n $NAMESPACE describe pod $POD`。
- 检查 Pod logs: `kubectl -n $NAMESPACE logs $POD -c $CONTAINER`。
- 检查 configmaps/secrets/volumes 挂载是否正常。
- 检查 Pod 的资源 requests, 特别是 GPU 等特殊资源的配置。
- 检查节点的 taints 和 capabilities 配置。

# 缓解

查阅[Pod 停滞在 Waiting 状态](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/#my-pod-stays-waiting)。
