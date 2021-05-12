
# First of all 2021/05/12

I can't configure `kubernetes-csi-driver-iscsi`
But container is looking good.

## trouble 1 iscsi driver not found

iscsiplugin containers are running iscsid, so container's distribution must be match to host OS.
if not, you'll encounter `iscsi driver not found`.

## trouble 2 target LUN is fixed to 0

https://github.com/kubernetes-csi/csi-driver-iscsi/issues/24

In my environment, LUN I want to use is "1"
LUN config is in yaml, but maybe ignored.

# kubernetes-csi-driver-iscsiplugin

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
