
# KubeAPITerminatedRequests

## 含义

APIServer 终止接收到的请求占比超过 20%。

## 影响

客户端将不能与集群进行正常交互。集群内的一些服务也许不可用。

## 诊断

查询指标 `apiserver_flowcontrol_rejected_requests_total` 确认是哪一个 flow_schema 正在限制到达 APIServer 的流量，它通常能够提供受影响的资源信息和 subject 信息。 