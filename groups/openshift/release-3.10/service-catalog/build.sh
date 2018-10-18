#!/bin/bash
#pull repo in /tmp
docker volume prune -f
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
export OS_BUILD_ENV_IMAGE=docker.io/jeffdyoung/f28-origin-release:golang-1.10-$arch
cp -f images/service-catalog/Dockerfile /tmp/service-catalog/images/service-catalog/Dockerfile
cp -f images/source/Dockerfile /tmp/service-catalog/images/source/Dockerfile
cd /tmp/service-catalog
hack/env make build-images
