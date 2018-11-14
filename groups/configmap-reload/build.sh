#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_CONFIGMAP=${WORKINGDIR_CONFIGMAP:-/tmp/configmap-reload}
export BRANCH=${BRANCH:-openshift-master}
export REPO=${REPO:-https://github.com/openshift/configmap-reload.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_CONFIGMAP

git clone $REPO $WORKINGDIR_CONFIGMAP
pushd $WORKINGDIR_CONFIGMAP
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_CONFIGMAP/Dockerfile
cd $WORKINGDIR_CONFIGMAP
docker build -t docker.io/jeffdyoung/configmap-reload:v3.11.0 -f Dockerfile .
#buildah bud -t  docker.io/jeffdyoung/kube-state-metrics:v3.11.0 -f Dockerfile .
