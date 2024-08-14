
# KubeHpaMaxedOut

## 含义

Horizontal Pod Autoscaler 运行在最大副本数上。持续超过15分钟时将触发告警。

## 影响

Horizontal Pod Autoscaler 将无法添加新的 Pod，从而无法扩容应用程序。

> 注意: 对于某些服务，将 HPA 最大化实际上是期望的。

## 诊断

- HPA 设置的最大副本数过低。
- Resource Requests（例如 CPU）设置过低？

## 缓解

如果进行了 CPU/Memory 的资源配置，请确保已经设置了合适的值。对于基于内存的缩放，请确保没有内存泄漏。如果使用自定义指标，则根据它来调整应用程序的缩放方式。  

使用性能测试查看应用程序的缩放情况。
