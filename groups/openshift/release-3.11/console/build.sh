#!/bin/bash
#pull repo

#set environment varibles for build
export arch=$(uname -m)
export WORKINGDIR_CONSOLE=${WORKINGDIR_CONSOLE:-/tmp/origin-console}
export OS_BUILD_ENV_IMAGE=${OS_BUILD_ENV_IMAGE:-docker.io/jeffdyoung/fedora-origin-release:golang-1.10-$arch}
export BRANCH=${BRANCH:-release-3.11}
export REPO=${REPO:-https://github.com/openshift/console.git}
#clean repo location /tmp/openshift and prune docker
rm -rf $WORKINGDIR_CONSOLE
rm -rf /tmp/openshift
docker volume prune -f

git clone $REPO $WORKINGDIR_CONSOLE
pushd $WORKINGDIR_CONSOLE
pwd
git checkout $BRANCH
popd
pwd
#cp -f Dockerfile $WORKINGDIR_CONSOLE/Dockerfile
pushd $WORKINGDIR_CONSOLE

popd
