#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/origin-web-console-server
rm -rf /tmp/openshift
source repo.txt
#build origin base
git clone $REPO /tmp/origin-web-console-server
pushd /tmp/origin-web-console-server
pwd
git checkout $BRANCH
popd
pwd
export OS_BUILD_ENV_IMAGE=fedora-origin-release:golang-1.9
cd /tmp/origin-web-console-server
hack/env make build-images
