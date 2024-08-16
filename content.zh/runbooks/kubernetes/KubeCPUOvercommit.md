
# KubeCPUOvercommit

## 含义


集群的 Pods CPU Requests 过度使用，将无法容忍节点故障。

<details>
<summary>更多信息</summary>

所有 Pods 的 CPU Requests 总和将超过集群的容量。如果发生节点故障，一些 Pods 将无法迁移到剩余的节点。

</details>

## 影响

集群无法忍受节点故障。一旦有某个节点故障，一些 Pods 将处于 `Pending` 状态。

## 诊断

- 检查应用的 CPU Requests 是否根据应用使用情况进行调整。
- 检查是否有节点处于可用状态但被隔离。
- 检查 cluster-autoscaler 在新增节点方面是否存在问题。

## 缓解

- 为集群添加更多的节点。通常更多较小节点要比少量较大节点好。
- 使用 Pod 优先级配置来避免重要服务的性能下降，参考[Pod 优先级和抢占](https://kubernetes.io/zh-cn/docs/concepts/scheduling-eviction/pod-priority-preemption/)。
- 添加不同的节点池，使用不同的实例类型，以避免仅使用一种类型时出现问题。
- 针对可预期的工作负载准备性能测试，据此提前规划集群规模。