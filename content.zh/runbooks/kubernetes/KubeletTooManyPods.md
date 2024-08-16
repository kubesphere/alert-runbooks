
# KubeletTooManyPods

## 含义

节点上运行的 Pods 总数超过所设置容量的 95%。持续时间超过15分钟时触发告警。

<details>
<summary>更多信息</summary>

Kubelet 具有限制其可运行 Pod 数量的配置。默认值为 110 个 Pods，但可配置。  

所以该告警规则结合 `kube_node_status_capacity_pods` 指标一起进行评估。

</details>

## 影响

在单个节点上运行大量 Pods 将给容器运行时接口 (CRI)、容器网络接口 (CNI) 和操作系统本身带来压力。接近该限制可能会影响该节点的性能和可用性。

## 诊断

> 消息详情/标签中包含 Node 信息。

- 检查节点节点上的 Pod 数量：`kubectl get pods --all-namespaces --field-selector spec.nodeName=$NODE_NAME`。

## 缓解

- Kubernetes 建议[每个节点的 Pod 数量不超过 110](https://kubernetes.io/zh-cn/docs/setup/best-practices/cluster-large/)。您可能需要迁移 Pods 到其他节点上。
- 如果您确定节点的性能足够处理更多 Pods，请更新 Kubelet 的相关配置：KubeletConfiguration 配置文件中的 `maxPods` 参数，或命令行参数 `--max-pods`。