#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/service-catalog
rm -rf /tmp/openshift
source repo.txt
export arch=$(uname -m)
#build service-catalog

git clone $REPO /tmp/service-catalog
pushd /tmp/service-catalog
pwd
git checkout $BRANCH
popd
pwd
export OS_BUILD_ENV_IMAGE=docker.io/jeffdyoung/fedora-origin-release:golang-1.10
cd /tmp/service-catalog
hack/env make build-images
