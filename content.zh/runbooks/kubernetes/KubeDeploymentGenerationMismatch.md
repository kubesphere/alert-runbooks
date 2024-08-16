
# KubeDeploymentGenerationMismatch

## 含义

Deployment 的 generation 不匹配，通常是 Deployment 更新失败了但还没有回滚导致。

## 影响

服务性能下降，甚至不可用。

## 诊断

> 消息详情/标签中包含 Deployment 的名称和 Namespace 信息。

参考[失败的 Deployment](https://kubernetes.io/zh-cn/docs/concepts/workloads/controllers/deployment/#failed-deployment)。

- 检查回滚历史记录 `kubectl -n $NAMESPACE rollout history deployment $NAME`。
- 检查滚动状态是否处于暂停状态。
- 通过 `kubectl -n $NAMESPACE describe deployment $NAME` 检查部署状态。
- 检查声明的副本数目。
- 检查新的 Pods 是否 crash。
- 检查属于这个 Deployment 下副本集的 Pods 状态。
- 检查 Pod 模板参数配置：
    - priority 优先级配置。可能一些重要性更高的 Pods 占用了资源，导致它无法调度。
    - resources 资源配置。比如它尝试使用不可用的 GPU 资源，但这些资源限制在特定的 GPU 节点上。
    - 亲和性规则。可能由于亲和性以及节点不足，导致它无法调度。
    - 终止宽限期。Pod 终止花费时间较长。
- 检查 HPA 是否正常触发。
