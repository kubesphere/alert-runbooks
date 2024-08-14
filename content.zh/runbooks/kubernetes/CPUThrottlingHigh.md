# CPUThrottlingHigh

## 含义

cpu 处于节流状态的时间占比高。

## 影响

这个告警是用来提供辅助信息的，在应用程序没有其他问题和告警时，通常可以跳过。

## 诊断

> 消息详情中包含 Pod, Container, Namespace 信息。
 
- 检查应用是否正常运行。
- 检查是否根据应用的使用情况调整了 CPU 资源请求。
- 检查节点内核版本。

## 缓解

在应用正常没有其他问题和告警时，通常不用增加 CPU 限制。

由于这个特定原因，该告警默认是被抑制的(这里指通知发送被抑制)，除非在相同 Namespace 下，有其他告警触发了。

**当和其他告警一起出现时：**

通常可以提高 Pod 相关容器的 CPU Limits 来缓解。而 Requests 可以保持不变。

在某些特定情况下，kubernetes 节点由于内核版本老旧，为进程分配 CPU 资源时可能会出现问题，具体参考[这里](https://github.com/kubernetes/kubernetes/issues/67577)。

