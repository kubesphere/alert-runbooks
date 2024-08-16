
# KubeAggregatedAPIErrors

## 含义

Kubernetes 聚合 API 报告错误。最近10分钟内，报告错误的次数超过4次时，触发告警。

## 影响

产生的影响因具体的聚合 API 而异。

## 诊断

> 消息详情中包含 APIService Name 信息。

- 检查 APIService：`kubectl describe APIService $NAME`。
- 检查聚合 API 对应服务的状态。(一般是 apiservice.spec.service 所指向的服务)。
- 检查 kube-apiserver 到聚合 API 对应服务的网络。

## 缓解

参考 [Kubernetes API 聚合层](https://kubernetes.io/zh-cn/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)。
