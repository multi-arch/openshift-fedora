#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_COCKPIT=${WORKINGDIR_COCKPIT:-/tmp/cockpit}
export BRANCH=${BRANCH:-master}
export REPO=${REPO:-https://github.com/cockpit-project/cockpit.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_COCKPIT
#build service-catalog

git clone $REPO $WORKINGDIR_COCKPIT
pushd $WORKINGDIR_COCKPIT
pwd
git checkout $BRANCH
popd

pwd
cp -f containers/kubernetes/Dockerfile $WORKINGDIR_COCKPIT/containers/kubernetes/Dockerfile
cd $WORKINGDIR_COCKPIT/containers/kubernetes
docker build -t docker.io/jeffdyoung/cockpit:$arch -f Dockerfile .
