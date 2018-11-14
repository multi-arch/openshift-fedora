#!/bin/bash

export arch=$(uname -m)
#export WORKINGDIR_NODE_EXPORTER=${WORKINGDIR_NODE_EXPORTER:-/tmp/node-exporter}
#export BRANCH=${BRANCH:-release-3.11}
#export REPO=${REPO:-https://github.com/openshift/node_exporter.git}

#pull repo in /tmp
docker volume prune -f
#rm -rf $WORKINGDIR_NODE_EXPORTER

#git clone $REPO $WORKINGDIR_NODE_EXPORTER
#pushd $WORKINGDIR_NODE_EXPORTER
#pwd
#git checkout $BRANCH
#popd

#pwd
#cp -f Dockerfile $WORKINGDIR_NODE_EXPORTER/Dockerfile
#cd $WORKINGDIR_NODE_EXPORTER
docker build -t docker.io/jeffdyoung/fedora-prometheus-node-exporter:v3.11.0 -f Dockerfile.golang .
#buildah bud -t  docker.io/jeffdyoung/fedora-node-exporter:v3.11.0 -f Dockerfile .
