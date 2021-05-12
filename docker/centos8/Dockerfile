# syntax=docker/dockerfile:1
# Build iscsiplugin from source
FROM golang:1.16 AS builder
RUN git clone https://github.com/kubernetes-csi/csi-driver-iscsi
RUN cd csi-driver-iscsi && \
  cp iscsiplugin.sh / && \
  cd cmd/iscsiplugin && \
  go build && \ 
  cp iscsiplugin /

# main container
FROM centos:8
COPY --from=builder /iscsiplugin .
COPY --from=builder /iscsiplugin.sh .
RUN yum -y install iscsi-initiator-utils e2fsprogs xfsprogs && yum clean all

ENTRYPOINT ["/iscsiplugin.sh"]
