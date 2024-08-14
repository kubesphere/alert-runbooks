
# KubeDeploymentRolloutStuck

## 含义

Deployment 滚动升级超过 15 分钟没有进展。

## 影响

服务性能下降，滚动升级不成功。

## 诊断

> 消息详情/标签中包含 Deployment 的名称和 Namespace 信息。

- 检查 Deployment 的部署状态：`kubectl -n $NAMESPACE rollout status deployment $NAME`。
- 检查 Deployment 状态：`kubectl -n $NAMESPACE describe deployment $NAME`。
- 检查 Deployment 是否有新的 Pod crash。

## 缓解

查阅 [kubectl rollout](https://kubernetes.io/zh-cn/docs/reference/kubectl/generated/kubectl_rollout/)。