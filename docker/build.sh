#!/bin/bash

MYDIR=$(cd "$(dirname "$0")"; pwd)
DATE=`date +%Y%m%d`
IMG=yakumosaki/iscsiplugin

echo createing ${IMG}:dist_${DATE}

DIST=buster
cd $MYDIR/$DIST
docker build -t ${IMG}:$DIST_latest${DATE} .
docker tag ${IMG}:$DIST_latest ${IMG}:$DIST_${DATE}

DIST=centos7
cd $MYDIR/$DIST
docker build -t ${IMG}:$DIST_latest${DATE} .
docker tag ${IMG}:$DIST_latest ${IMG}:$DIST_${DATE}

DIST=centos8
cd $MYDIR/$DIST
docker build -t ${IMG}:$DIST_latest${DATE} .
docker tag ${IMG}:$DIST_latest ${IMG}:$DIST_${DATE}
