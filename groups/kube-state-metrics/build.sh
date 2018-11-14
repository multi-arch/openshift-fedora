#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_KUBESTATE=${WORKINGDIR_KUBESTATE:-/tmp/kube-state-metrics}
export BRANCH=${BRANCH:-openshift-master}
export REPO=${REPO:-https://github.com/openshift/kube-state-metrics.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_KUBESTATE

git clone $REPO $WORKINGDIR_KUBESTATE
pushd $WORKINGDIR_KUBESTATE
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_KUBESTATE/Dockerfile
cd $WORKINGDIR_KUBESTATE
docker build -t docker.io/jeffdyoung/kube-state-metrics:v3.11.0 -f Dockerfile .
#buildah bud -t  docker.io/jeffdyoung/kube-state-metrics:v3.11.0 -f Dockerfile .
