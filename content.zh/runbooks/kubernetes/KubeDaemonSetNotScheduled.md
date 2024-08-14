---
title: Kube DaemonSet Not Scheduled
---

# KubeDaemonSetNotScheduled

## 含义

DaemonSet 的 Pods 未被调度。

## 影响

服务性能下降甚至不可用。

## 诊断

> 消息详情/标签中包含 DaemonSet 的名称和 Namespace 信息。

以下情况可能触发这个告警：

- DaemonSet 配置了错误的 Pod nodeSelector/taints/affinities。
- 节点资源不足。

检查以下方面：

- 检查 DaemonSet 的状态：`kubectl -n $NAMESPACE describe daemonset $NAME`。
- 检查 DaemonSet 的[更新策略](https://kubernetes.io/zh-cn/docs/tasks/manage-daemon/update-daemon-set/#daemonset-update-strategy)。
- 检查 Pod 模板参数配置：
    - priority 优先级配置。可能一些重要性更高的 Pods 占用了资源，导致它无法调度。
    - resources 资源配置。比如它尝试使用不可用的 GPU 资源，但这些资源限制在特定的 GPU 节点上。
    - 亲和性规则。可能由于亲和性以及节点不足，导致它无法调度。

## 缓解

根据 DaemonSet 的重要性设置合适的 priority。  
