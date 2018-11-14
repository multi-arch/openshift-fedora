#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_PROMETHEUSOP=${WORKINGDIR_PROMETHEUSOP:-/tmp/prometheus-operator}
export BRANCH=${BRANCH:-openshift-master}
export REPO=${REPO:-https://github.com/openshift/prometheus-operator.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_PROMETHEUSOP

git clone $REPO $WORKINGDIR_PROMETHEUSOP
pushd $WORKINGDIR_PROMETHEUSOP
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_PROMETHEUSOP/Dockerfile
cd $WORKINGDIR_PROMETHEUSOP
docker build -t docker.io/jeffdyoung/fedora-prometheus-operator:v3.11.0 -f Dockerfile .
#buildah bud -t  docker.io/jeffdyoung/fedora-prometheus-operator:v3.11.0 -f Dockerfile .
