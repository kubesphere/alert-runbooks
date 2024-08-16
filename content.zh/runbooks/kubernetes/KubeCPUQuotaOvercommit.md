
# KubeCPUQuotaOvercommit

## 含义


集群为 Namespaces 配置的 ResourceQuotas 的 CPU Requests 过度，将无法容忍节点故障。

## 影响

当有节点故障时，一些 Pods 将处于 `Pending` 状态。

## 诊断

- 检查 ResourceQuotas 的 CPU Requests 是否根据使用情况进行调整。
- 检查是否有节点处于可用状态但被隔离。
- 检查 cluster-autoscaler 在新增节点方面是否存在问题。

## 缓解

- 查看存在的 ResourceQuotas，根据实际使用情况调整资源请求配置。
- 为集群添加更多的节点。通常更多较小节点要比少量较大节点好。
- 使用 Pod 优先级配置来避免重要服务的性能下降，参考[Pod 优先级和抢占](https://kubernetes.io/zh-cn/docs/concepts/scheduling-eviction/pod-priority-preemption/)。
- 添加不同的节点池，使用不同的实例类型，以避免仅使用一种类型时出现问题。
- 针对可预期的工作负载准备性能测试，据此提前规划集群规模。