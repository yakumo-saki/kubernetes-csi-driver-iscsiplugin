#!/bin/bash

MYDIR=$(cd "$(dirname "$0")"; pwd)
DATE=`date +%Y%m%d`
IMG=yakumosaki/iscsiplugin

echo createing ${IMG}:dist_${DATE}

DIST=buster
cd $MYDIR/$DIST
docker build -t ${IMG}:${DIST}_latest .
docker tag ${IMG}:${DIST}_latest ${IMG}:${DIST}_${DATE}

DIST=centos7
cd $MYDIR/$DIST
docker build -t ${IMG}:${DIST}_latest .
docker tag ${IMG}:${DIST}_latest ${IMG}:${DIST}_${DATE}

DIST=centos8
cd $MYDIR/$DIST
docker build -t ${IMG}:${DIST}_latest .
docker tag ${IMG}:${DIST}_latest ${IMG}:${DIST}_${DATE}

echo pushing to dockerhub
docker push -a ${IMG}