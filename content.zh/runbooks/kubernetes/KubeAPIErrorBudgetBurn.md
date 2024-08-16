
# KubeAPIErrorBudgetBurn

## 含义

APIServer 处理请求时的错误率较高。

<details>
<summary>更多上下文</summary>

该告警本质上意味着 kube-apiserver 在处理请求时出现错误的比例高于预期。由于随机错误不可避免，因此它允许 kube-apiserver 出现一定比例的错误。

参考 [Alerting on SLOs](https://sre.google/workbook/alerting-on-slos/#recommended_time_windows_and_burn_rates_f) 了解更多细节。

</details>

## 影响

集群的整体可用性下降。APIServer 返回太多错误或响应时间太长时可能无法保证 controllers 正常的 reconcile 过程。

消息标签中包含告警级别(severity), long, short。根据这些信息的不同，影响程度不同。

**紧急(critical)级别**

检查 long 和 short 的标签：

- 标签值为 `long: 1h` 和 `short: 5m`：集群可能在2d或更短时间后变得不可用。应尽快修复相关问题。
- 标签值为 `long: 6h` 和 `short: 30m`: 集群可能在5d或更短时间后变得不可用。应持续跟踪这个问题，尽管可能不需要立即修复。

**警告(warning)级别**

检查 long 和 short 的标签：
- 标签值为 `long: 1d` 和 `short: 2h`：集群可能在10d或更短时间后变得不可用。长期持续出现将是个问题，可在接下来的24-48h进行观察。
- 标签值为 `long: 3d` 和 `short: 6h`: 集群可能在30d或更短时间后变得不可用。可以暂时放置，在后续的工作日再进行排查。

## 诊断

- KubeSphere Console 中通过"集群"->"监控告警"->"集群状态"菜单进入在 "API Server 监控"中查看请求的延迟情况。
- 在 Grafana 中查看 APIServer 的 dashboard。
    - 在 dashboard 的靠上部分查看可用性和错误预算百分比情况，它们通常可表征问题的严重情况。
    - 查看读写请求的错误率指标图表。
    - 查看读写请求的延迟指标图表。
- 检查 kube-apiserver 的日志，特别是请求异常和延迟高等方面的日志。
- 检查 kube-apiserver 所依赖的服务，比如 etcd 的负载情况。
