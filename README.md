## kubernetes-csi-driver-iscsiplugin

Build container for csi-driver-iscsi https://github.com/kubernetes-csi/csi-driver-iscsi

## dockerhub

https://hub.docker.com/repository/docker/yakumosaki/iscsiplugin

## Change from original

Origin:

https://github.com/kubernetes-csi/csi-driver-iscsi/commit/1d17e717262b5f162d515e742b124e36519e0dff

### Dockerfile

* Change base container to centos:8 (was centos:7)
* Add build iscsiplugin with golang:1.16