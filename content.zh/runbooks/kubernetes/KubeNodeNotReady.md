
# KubeNodeNotReady

## 含义

Kubernetes 节点处于未就绪状态。持续超过15分钟时将触发该告警。

## 影响

新的 Pods 将不再调度到这样的节点。  

集群的性能将受到影响，具体取决于对应节点的类型和工作负载。

## 诊断

> 消息详情/标签中包含 Node 的名称。

- 检查节点的状态：`kubectl get node $NODE -oyaml`。命令输出中一般会描述节点未就绪的原因。
- 查询 kubelet 日志，排查节点未就绪的可能原因。

常见的故障情况：

- 网络问题。
- 资源不足。
- 硬件故障。

## 缓解

查阅 [KubeNode 文档](https://kubernetes.io/zh-cn/docs/concepts/architecture/nodes/)。
