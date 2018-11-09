#!/bin/bash
#pull repo in /tmp

export arch=$(uname -m)
export WORKINGDIR_WEB=${WORKINGDIR_WEB:-/tmp/origin-web-console-server}
export OS_BUILD_ENV_IMAGE=${OS_BUILD_ENV_IMAGE:-docker.io/jeffdyoung/f28-origin-release:golang-1.9-$arch}
export BRANCH=${BRANCH:-release-3.10}
export REPO=${REPO:-https://github.com/openshift/origin-web-console-server.git}


rm -rf $WORKINGDIR_WEB 
rm -rf /tmp/openshift
docker volume prune -f

git clone $REPO $WORKINGDIR_WEB
pushd $WORKINGDIR_WEB
pwd
git checkout $BRANCH
popd
pwd
cd $WORKINGDIR_WEB
hack/env make build-images
