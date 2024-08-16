---
title: Kube StatefulSet Replicas Mismatch
---

# KubeStatefulSetReplicasMismatch

## 含义

StatefulSet 与预期的副本数量不匹配。

## 影响

服务性能下降，甚至不可用。

## 诊断

> 消息详情/标签中包含 StatefulSet 的名称和 Namespace 信息。

- 检查 StatefulSet 状态：`kubectl -n $NAMESPACE describe statefulset $NAME`。
- 检查声明的副本数量。
- 检查 StatefulSet 的[更新策略](https://kubernetes.io/zh-cn/docs/concepts/workloads/controllers/statefulset/#update-strategies)。
- 检查 StatefulSet 的当前 ControllerRevision，以及该 ControllerRevision 下的 Pods 状态。
- 检查 StatefulSet 与卷的连接是否存在问题。

## 缓解

阅读应用的相关文档，或与应用的开发者沟通，确保定义了合适的配置来启动或更新应用。  

查看[调试 Pods](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/)。