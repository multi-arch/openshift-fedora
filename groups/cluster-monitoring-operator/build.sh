#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_CLUSTER_MON_OP=${WORKINGDIR_CLUSTER_MON_OP:-/tmp/cluster-monitoring-operator}
export BRANCH=${BRANCH:-release-3.11}
export REPO=${REPO:-https://github.com/openshift/cluster-monitoring-operator.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_CLUSTER_MON_OP

git clone $REPO $WORKINGDIR_CLUSTER_MON_OP
pushd $WORKINGDIR_CLUSTER_MON_OP
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_CLUSTER_MON_OP/Dockerfile
cd $WORKINGDIR_CLUSTER_MON_OP
docker build -t docker.io/jeffdyoung/fedora-cluster-monitoring-operator:v3.11.0 -f Dockerfile .
