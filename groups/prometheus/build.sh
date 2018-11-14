#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_PROMETHEUS=${WORKINGDIR_PROMETHEUS:-/tmp/prometheus}
export BRANCH=${BRANCH:-master}
export REPO=${REPO:-https://github.com/openshift/prometheus.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_PROMETHEUS

git clone $REPO $WORKINGDIR_PROMETHEUS
pushd $WORKINGDIR_PROMETHEUS
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_PROMETHEUS/Dockerfile
cd $WORKINGDIR_PROMETHEUS
#docker build -t docker.io/jeffdyoung/fedora-prometheus:v3.11.0 -f Dockerfile .
buildah bud -t  docker.io/jeffdyoung/fedora-prometheus:v3.11.0 -f Dockerfile .
