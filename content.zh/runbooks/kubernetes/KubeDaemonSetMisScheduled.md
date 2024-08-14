---
title: Kube DaemonSet MisScheduled
---

# KubeDaemonSetMisScheduled

## 含义

DaemonSet 的 Pods 运行在它们不应该运行的地方。

## 影响

服务性能下降甚至不可用。Pods 所运行的地方可能会被其他应用占用大量资源。

## 诊断

> 消息详情/标签中包含 DaemonSet 的名称和 Namespace 信息。

以下情况可能触发这个告警：

- DaemonSet 配置了错误的 Pod nodeSelector/taints/affinities。
- 节点被 tainted 但是 DaemonSet 已存在的 Pods 没被驱逐。

检查以下方面：

- 检查 DaemonSet 的状态：`kubectl -n $NAMESPACE describe daemonset $NAME`。
- 检查 DaemonSet 的[更新策略](https://kubernetes.io/zh-cn/docs/tasks/manage-daemon/update-daemon-set/#daemonset-update-strategy)。
- 检查 Pod 模板参数配置，比如优先级以及亲和性规则的配置等。

## 缓解

修正 DaemonSet 的配置。  

对于不应该调度到被 tainted 节点上的 Pods，可以手动删除。
