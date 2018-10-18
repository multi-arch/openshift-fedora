#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/origin-web-console-server
rm -rf /tmp/openshift
docker volume prune -f
source repo.txt
export arch=$(uname -m)
#build origin base
git clone $REPO /tmp/origin-web-console-server
pushd /tmp/origin-web-console-server
pwd
git checkout $BRANCH
popd
pwd
export OS_BUILD_ENV_IMAGE=docker.io/jeffdyoung/f28-origin-release:golang-1.9-$arch
cd /tmp/origin-web-console-server
hack/env make build-images
