#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_CATALOG=${WORKINGDIR_CATALOG:-/tmp/service-catalog}
export OS_BUILD_ENV_IMAGE=${OS_BUILD_ENV_IMAGE:-docker.io/jeffdyoung/f28-origin-release:golang-1.10-$arch}
export BRANCH=${BRANCH:-release-3.10}
export REPO=${REPO:-https://github.com/openshift/service-catalog.git}


#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_CATALOG
rm -rf /tmp/openshift
#build service-catalog

git clone $REPO $WORKINGDIR_CATALOG
pushd $WORKINGDIR_CATALOG
pwd
git checkout $BRANCH
popd
pwd
cp -f images/service-catalog/Dockerfile $WORKINGDIR_CATALOG/images/service-catalog/Dockerfile
cp -f images/source/Dockerfile $WORKINGDIR_CATALOG/images/source/Dockerfile
cd $WORKINGDIR_CATALOG
hack/env make build-images
