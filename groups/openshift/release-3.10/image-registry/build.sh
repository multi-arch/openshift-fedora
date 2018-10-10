#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/image-registry
rm -rf /tmp/openshift
source repo.txt
export arch=$(uname -m)
#build image-registry

git clone $REPO /tmp/image-registry
pushd /tmp/image-registry
pwd
git checkout $BRANCH
popd
pwd
export OS_BUILD_ENV_IMAGE=docker.io/jeffdyoung/f28-origin-release:golang-1.10-$arch
cd /tmp/image-registry
hack/env make build-images
