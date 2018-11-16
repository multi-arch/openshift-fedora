#!/bin/bash
#pull repo in /tmp
export arch=$(uname -m)
export WORKINGDIR_REGISTRY=${WORKINGDIR_REGISTRY:-/tmp/image-registry}
export OS_BUILD_ENV_IMAGE=${OS_BUILD_ENV_IMAGE:-docker.io/jeffdyoung/fedora-origin-release:golang-1.10}
export BRANCH=${BRANCH:-release-3.10}
export REPO=${REPO:-https://github.com/openshift/image-registry.git}



rm -rf $WORKINGDIR_REGISTRY
rm -rf /tmp/openshift
docker volume prune -f


#build image-registry
git clone $REPO $WORKINGDIR_REGISTRY
pushd $WORKINGDIR_REGISTRY
pwd
git checkout $BRANCH
popd
pwd
cd $WORKINGDIR_REGISTRY 
hack/env make build-images
