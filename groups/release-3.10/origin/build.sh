#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/origin
rm -rf /tmp/openshift
source repo.txt
#build origin base
git clone $REPO /tmp/origin
pushd /tmp/origin
pwd
git checkout $BRANCH
popd
pwd
export OS_BUILD_ENV_IMAGE=fedora-origin-release:golang-1.10
cp -f hack/build-rpms.sh /tmp/origin/hack/build-rpms.sh
#copy fedora dockerfiles
cp -f images/base/Dockerfile /tmp/origin/images/base/Dockerfile
cp -f images/builder/docker/docker-builder/Dockerfile /tmp/origin/images/builder/docker/docker-builder/Dockerfile
cp -f images/cli/Dockerfile /tmp/origin/images/cli/Dockerfile
cp -f images/egress/http-proxy/Dockerfile /tmp/origin/images/egress/http-proxy/Dockerfile
cp -f images/egress/dns-proxy/Dockerfile /tmp/origin/images/egress/dns-proxy/Dockerfile
cp -f images/egress/router/Dockerfile /tmp/origin/images/egress/router/Dockerfile
cp -f images/hyperkube/Dockerfile /tmp/origin/images/hyperkube/Dockerfile
cp -f images/hypershift/Dockerfile /tmp/origin/images/hypershift/Dockerfile
cp -f images/ipfailover/keepalived/Dockerfile /tmp/origin/images/ipfailover/keepalived/Dockerfile
cp -f images/node/Dockerfile /tmp/origin/images/node/Dockerfile
cp -f images/origin/Dockerfile /tmp/origin/images/origin/Dockerfile
cp -f images/pod/Dockerfile /tmp/origin/images/pod/Dockerfile
cp -f images/router/haproxy/Dockerfile /tmp/origin/images/router/haproxy/Dockerfile
cp -f images/router/nginx/Dockerfile /tmp/origin/images/router/nginx/Dockerfile
cp -f images/router/f5/Dockerfile /tmp/origin/images/router/f5/Dockerfile
cp -f images/source/Dockerfile /tmp/origin/images/source/Dockerfile
cp -f images/template-service-broker/Dockerfile /tmp/origin/images/template-service-broker/Dockerfile
cp -f images/tests/Dockerfile /tmp/origin/images/tests/Dockerfile
cd /tmp/origin
hack/env hack/build-base-images.sh
hack/env make release
