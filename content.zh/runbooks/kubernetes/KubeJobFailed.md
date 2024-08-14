
# KubeJobFailed

## 含义

Job 完成失败。

## 影响

处理计划任务失败。

## 诊断

> 消息详情中包含 Job, Namespace 信息。

- 检查 Job: `kubectl -n $NAMESPACE describe jobs $JOB`
- 检查 Pod events: `kubectl -n $NAMESPACE describe pod $POD_FROM_JOB`
- 检查 Pod logs: `kubectl -n $NAMESPACE log pod $POD_FROM_JOB`

> 排查完成后，移除这个 Job，将不再告警。

## 缓解

查阅[调试 Pods](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/)。  

查阅 [Job 文档](https://kubernetes.io/zh-cn/docs/tasks/job/) 获取帮助。
