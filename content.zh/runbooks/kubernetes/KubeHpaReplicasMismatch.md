
# KubeHpaReplicasMismatch

## 含义

Horizontal Pod Autoscaler(HPA) 未能达到所需的副本数量。超过 15 分钟时将触发该告警。

## 影响

HPA 不能调度期望的 Pods 数量。

## 诊断

HPA 无法进行扩容可能的原因：

- 集群中的节点不足。
- ResourceQuota 设置了限额。
- Pod 由于 priority 的限制被驱逐。

## 缓解

在使用 cluster-autoscaler 时，您可能需要设置抢占式 Pod 池，以确保及时创建节点。