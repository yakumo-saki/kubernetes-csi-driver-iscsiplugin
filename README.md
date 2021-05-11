## kubernetes-csi-driver-iscsiplugin

Build container for csi-driver-iscsi https://github.com/kubernetes-csi/csi-driver-iscsi

### note

It is not Dynamic Provisioner.
Needs manual PV creation.

## dockerhub

https://hub.docker.com/repository/docker/yakumosaki/iscsiplugin

## Change from original

Origin:

https://github.com/kubernetes-csi/csi-driver-iscsi/commit/1d17e717262b5f162d515e742b124e36519e0dff

### Dockerfile

* Change base container to centos:8 (was centos:7)
* Add build iscsiplugin with golang:1.16

## How to use

### get YAML

https://github.com/kubernetes-csi/csi-driver-iscsi/tree/master/kubernetes

### change `iscsiplugin` image to your's

NOTE: see examples directory to fixed YAMLs

* `csi-attacher-iscsiplugin.yaml`
* `csi-nodeplugin-iscsiplugin.yaml`

Change 

```
image: iscsiplugin:latest
```
to
```
image: example.com/account/iscsiplugin:latest
```
