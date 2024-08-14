
# KubeNodeUnreachable

## 含义

Kubernetes 节点不可达。一些工作负载可能会被重新调度。


## 影响

集群的性能将受到影响，具体取决于对应节点的类型和工作负载。

## 诊断

> 消息详情/标签中包含 Node 的名称。

- 检查节点的状态：`kubectl get node $NODE -oyaml`。命令输出一般会描述节点不可达的原因。

常见的故障情况：

- 破坏性的软件升级。
- 网络或防火墙问题。
- 硬件故障。
- 由于存储区域网络问题而导致的虚拟机暂停。
- 由于软件或硬件故障而导致的系统崩溃/冻结。

## 缓解

如果需要节点进入维护状态，请先[隔离和清空节点](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/safely-drain-node/)。 

其他情况下，请确保可用的存储和网络冗余。  

另外，可考虑使用节点问题检测器（Node Problem Detector）等工具来更好地来探测节点的具体问题。  

查阅 [KubeNode 文档](https://kubernetes.io/zh-cn/docs/concepts/architecture/nodes/)。
