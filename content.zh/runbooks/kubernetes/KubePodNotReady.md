
# KubePodNotReady

## 含义

Pod 处于未就绪状态。超过 15 分钟将触发告警。  

处于 Running 状态但未就绪，意味着就绪探针检测失败。  
处于 Pending 状态，表示它不能在指定的 Namespace 和 Node 上创建。  

<details>
<summary>更多信息</summary>

Pod 未能达到就绪状态，依赖于就绪探针/存活探针。  
查阅 [Pod 生命周期](https://kubernetes.io/zh-cn/docs/concepts/workloads/pods/pod-lifecycle/)。

</details>

## 影响

1. 服务性能下降，甚至不可用。
2. Pod 不能关联到 Service 而没有任何流量。

## 诊断

> 消息详情中包含 Pod 的名称和 Namespace 信息。

- 检查 Pod 的 events：`kubectl -n $NAMESPACE describe pod $POD`
- 检查 Pod 的 logs: `kubectl -n $NAMESPACE logs $POD -c $CONTAINER`
- 检查 Pod 模板参数：
    - priority 优先级配置。
    - resources 资源配置：比如它尝试使用不可用的 GPU 资源，但这些资源限制在特定的 GPU 节点上。
    - 就绪探针或存活探针配置不正确：端口或命令配置错误，或探针超时时间过短等。

其他可能需要排查的点：

- 应用响应较慢，由于资源方面的约束，比如内存或 CPU 限制较低。
- 应用依赖于其他服务，后者尚未就绪。
- 配置错误。
- configmaps/secrets/volumes 等配置丢失。
- 文件系统只读。
- 容器中用户权限错误。
- 容器能力缺失。(securityContext)
- 应用执行在不期待的目录。 (例如在 OpenShift 中，不会使用 Dockerfile 的 WORKDIR)

## 缓解

阅读应用的相关文档，或与应用的开发者沟通，确保定义了合适的配置来启动应用。

查阅[调试 Pods](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/)。