
# KubeClientCertificateExpiration

## 含义

用于向 Apiserver 进行身份验证的客户端证书过期时间小于7天(警告告警)或24小时(严重告警)。

## 影响

- 客户端不能与集群交互。
- 集群中依赖 Kubernetes API 的服务可能变得不可用。

## 诊断

- 检查证书发布时间以及过期时间：使用 [KubeKey](https://github.com/kubesphere/kubekey/blob/master/docs/check-renew-certificate.md#check-certificate-expiration) 或 [kubeadm](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/#check-certificate-expiration) 等工具检查集群内由 kubeadm 管理的证书的过期情况。(使用其他工具创建的集群请参考工具的对应文档)
- 检查 serviceAccounts 以及相关的 tokens。

> 如果集群外部的客户端使用了过期的证书请求 Apiserver，一般可通过 Apiserver 日志寻找客户端信息。
可以参考[证书验证失败时的异常](https://github.com/kubernetes/kubernetes/blob/release-1.29/staging/src/k8s.io/apiserver/pkg/authentication/request/x509/x509.go#L183)以及[请求认证失败的日志输出](https://github.com/kubernetes/kubernetes/blob/release-1.29/staging/src/k8s.io/apiserver/pkg/endpoints/filters/authentication.go#L73)查找关联信息。(这些信息的格式可能随 Kubernetes 版本会有所变化)

## 缓解

- 更新客户端证书：使用 [KubeKey](https://github.com/kubesphere/kubekey/blob/master/docs/check-renew-certificate.md#renew-certificate) 或 [kubeadm](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/#manual-certificate-renewal) 等工具手动更新集群内部使用的客户端证书。或使用 [kubeadm](https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/#automatic-certificate-renewal) 设置自动更新证书。(使用其他工具创建的集群请参考工具的对应文档)

> 如果集群外部的客户端使用了过期的证书请求 Apiserver，请更新相应证书或更新 kubeconfig。

- 如果是集群内的服务，一般需要重建 Pod。
