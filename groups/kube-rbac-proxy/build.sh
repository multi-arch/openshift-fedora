#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_RBAC=${WORKINGDIR_RBAC:-/tmp/kube-rbac-proxy}
export BRANCH=${BRANCH:-openshift-master}
export REPO=${REPO:-https://github.com/openshift/kube-rbac-proxy.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_RBAC

git clone $REPO $WORKINGDIR_RBAC
pushd $WORKINGDIR_RBAC
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_RBAC/Dockerfile
cd $WORKINGDIR_RBAC
docker build -t docker.io/jeffdyoung/fedora-kube-rbac-proxy:v3.11.0 -f Dockerfile .
