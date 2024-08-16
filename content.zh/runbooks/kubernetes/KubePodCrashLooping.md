
# KubePodCrashLooping

## 含义

Pod 处于 CrashLooping 状态，意味着应用程序死亡或无响应，kubernetes 自动尝试重启它。

## 影响

1. 服务性能下降，甚至不可用。
2. 无法进行滚动升级。
3. 某些应用程序将无法执行必要的任务，例如数据迁移。

## 诊断

> 消息详情/标签中包含 Pod 的名称和 Namespace 信息。

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

阅读应用的相关文档，或与应用的开发者沟通，确保定义了合适的配置来启动或更新应用。

查阅[调试 Pods](https://kubernetes.io/zh-cn/docs/tasks/debug/debug-application/debug-pods/)。