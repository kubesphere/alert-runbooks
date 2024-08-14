
# KubeQuotaFullyUsed

## 含义

Namespace 达到了允许的硬资源配额限制。

## 影响

Namespace 下不再能创建新的负载。

## 诊断

> 消息详情/标签中包含 Namespace 和资源类型。

- 检查这个 Namespace 下对应类型的资源用量。

## 缓解

- 优化资源配额设置：检查这个 Namespace 的资源配额(ResourceQuota)设置，确保它们与实际需求相匹配。适时考虑增加相应类型的资源配额，以在相应 Namespace 下容纳更多的工作负载。
- 优化资源使用：检查这个 Namespace 的资源实际使用情况，优化相关工作负载的资源配置，以减少不必要的资源消耗。
- 容量规划：确保您的集群容量规划处于良好状态，以满足未来的需求。根据应用程序的增长和需求，考虑适时扩展集群。
- 查阅[资源配额文档](https://kubernetes.io/zh-cn/docs/concepts/policy/resource-quotas/)。