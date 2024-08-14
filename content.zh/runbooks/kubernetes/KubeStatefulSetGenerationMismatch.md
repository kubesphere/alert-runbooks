---
title: Kube StatefulSet Generation Mismatch
---

# KubeStatefulSetGenerationMismatch

## 含义

StatefulSet 的 generation 不匹配，通常是 StatefulSet 失败了但还没有回滚导致。

## 影响

服务性能下降，甚至不可用。

## 诊断

> 消息详情/标签中包含 StatefulSet 的名称和 Namespace 信息。

- 检查 StatefulSet 的部署状态：`kubectl -n $NAMESPACE rollout status statefulset $NAME`。
- 检查 StatefulSet 的部署历史：`kubectl -n $NAMESPACE rollout history statefulset $NAME`。
- 检查 StatefulSet 状态：`kubectl -n $NAMESPACE describe statefulset $NAME`。
- 检查声明的副本数量。
- 检查 StatefulSet 的[更新策略](https://kubernetes.io/zh-cn/docs/concepts/workloads/controllers/statefulset/#update-strategies)。
- 检查 StatefulSet 下是否有新的 pod crash。
- 检查 StatefulSet 的当前 ControllerRevision，以及该 ControllerRevision 下的 Pods 状态。
- 检查 StatefulSet 与卷的连接是否存在问题。

## 缓解

阅读应用的相关文档，或与应用的开发者沟通，确保定义了合适的配置来启动或更新应用。  

Statefulset 比较特殊，Pod 终止前一般会有特殊的处理逻辑。比如看看是否执行了数据迁移等特殊命令，这可能会大大减慢进度。  

如果是横向扩展时出现这个问题，通过添加新节点可能解决它，否则可能需要修复 StatefulSet 配置。  

少数情况下可能需要回滚到先前版本，参考[滚动更新文档](https://kubernetes.io/zh-cn/docs/concepts/workloads/controllers/statefulset/#rolling-updates)。  

极少数情况下可能需要删除有问题的 Pods。

查看[调试 Pods](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/)。