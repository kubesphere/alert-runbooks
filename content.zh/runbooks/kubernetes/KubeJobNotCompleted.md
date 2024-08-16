
# KubeJobNotCompleted

## 含义

Job 超过 12h 未完成。

## 影响

- Job 处理时间过长。
- 下一个 Job 调度可能受到影响。

## 诊断

> 消息详情中包含 Job, Namespace 信息。

- 检查 Job: `kubectl -n $NAMESPACE describe jobs $JOB`。
- 检查 Pod events: `kubectl -n $NAMESPACE describe pod $POD_FROM_JOB`。
- 检查 Pod logs: `kubectl -n $NAMESPACE log pod $POD_FROM_JOB`。

## 缓解

可以给它配置更多的 resources，让它完成得更快。  

查阅 [Job 文档](https://kubernetes.io/zh-cn/docs/tasks/job/) 获取帮助。
