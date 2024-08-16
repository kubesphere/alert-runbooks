
# KubeDeploymentReplicasMismatch

## 含义

Deployment 与预期的副本数量不匹配。

## 影响

服务性能下降，甚至不可用。

## 诊断

> 消息详情/标签中包含 Deployment 的名称和 Namespace 信息。

- 检查 Deployment 状态：`kubectl -n $NAMESPACE describe deployment $NAME`。
- 检查 Deployment 声明的副本数量。
- 检查属于这个 Deployment 下副本集的 Pods 状态。
