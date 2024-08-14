# KubePersistentVolumeFillingUp

## 含义

持久卷即将被填满时触发告警。

> 这个问题的原因可能有很多，这里不会覆盖与应用程序相关的特定原因，仅就出现该问题时如何缓解进行说明。

## 影响

服务性能下降，可能切换到只读模式。

## 诊断

> 消息详情/标签中包含 PersistentVolumeClaim(PVC) 名称 和 Namespace。

检查应用的存储使用情况，确认数据是如何累积的。比如快照配置和数据保留配置导致了数据累积。

## 缓解

### 数据保留配置

删除不再需要的数据是最快和最便捷的解决方式。但请先与应用服务的所有者联系，确定是否可以删除特定的旧数据。
另外，如果可行，请也对快照数据进行保留期限设置。

### 数据导出

如果数据对服务本身不再需要，但稍后可能需要进行其他处理，则可以将数据转移到其他地方，比如 S3 对象存储中。

### 数据再平衡

一些应用以多个实例的集群模式提供服务，而且能够在实例之间重新平衡数据。如果支持这种特性，请增加服务的副本数量并等待数据迁移，或手动触发它。

### 调整卷大小

如果卷大小可调整，可直接增加卷的容量。  

查看对应的 StorageClass 是否支持卷扩展：

```shell
$ kubectl get storageclass `kubectl -n $NAMESPACE get pvc $PVC -ojson | jq -r '.spec.storageClassName'`       
NAME                 PROVISIONER            RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
standard (default)   kubernetes.io/gce-pd   Delete          Immediate           true                   28d
```

如果 `VOLUMEBINDINGMODE` 是 `true`，则可以使用这个特性，修改 PVC 的大小：

```shell
kubectl -n $NAMESPACE edit pvc $PVC
```  

然后查看 PVC 状态：

```shell
kubectl -n $NAMESPACE get pvc $PVC
```

当它的状态包含 "Waiting for user to (re-)start a pod to finish file system resize of volume on node." 时，请重启相应的 Pod。通常删除对应的 Pod 后会自动创建，以下命令可以删除与相关 PVC 所挂载的那个 Pod：

```shell
$ kubectl -n $NAMESPACE delete pod `kubectl -n $NAMESPACE get pod -ojson | jq -r '.items[] | select(.spec.volumes[] .persistentVolumeClaim.claimName=="$PVC") | .metadata.name'`
```

### 迁移数据到更大的卷

如果卷大小不可调，而数据又不能删除，就只能创建一个更大的卷，然后进行数据迁移。