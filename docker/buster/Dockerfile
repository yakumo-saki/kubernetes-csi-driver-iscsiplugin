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
FROM debian:buster-slim
COPY --from=builder /iscsiplugin .
COPY --from=builder /iscsiplugin.sh .
RUN apt-get update && \
  apt-get install -y --no-install-recommends open-iscsi lsscsi sg3-utils multipath-tools scsitools && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
  
ENTRYPOINT ["/iscsiplugin.sh"]
