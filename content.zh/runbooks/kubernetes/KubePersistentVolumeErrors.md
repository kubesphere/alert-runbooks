# KubePersistentVolumeErrors

## 含义

在提供持久卷(PersistentVolume)遇到问题时触发告警。

## 影响

- 卷不可用或具有数据错误(存储损坏)。
- 服务性能下降或数据丢失。

## 诊断

> 消息详情/标签中包含 PersistentVolume 的名称。

- 检查 PV 的 events：`kubectl describe pv $PV`。
- 检查存储提供方的组件日志。
- 检查云上的存储配额设置。

