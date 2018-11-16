#!/bin/bash
#pull repo

#set environment varibles for build
export arch=$(uname -m)
export WORKINGDIR_ORIGIN=${WORKINGDIR_ORIGIN:-/tmp/origin}
export OS_BUILD_ENV_IMAGE=${OS_BUILD_ENV_IMAGE:-docker.io/jeffdyoung/fedora-origin-release:golang-1.10}
export BRANCH=${BRANCH:-release-3.11}
export REPO=${REPO:-https://github.com/openshift/origin.git}
#clean repo location /tmp/openshift and prune docker
rm -rf $WORKINGDIR_ORIGIN
rm -rf /tmp/openshift
docker volume prune -f

git clone $REPO $WORKINGDIR_ORIGIN
pushd $WORKINGDIR_ORIGIN
pwd
git checkout $BRANCH
popd
pwd
#copy build-rpms file that supports fedora
cp -f hack/build-rpms.sh $WORKINGDIR_ORIGIN/hack/build-rpms.sh
#copy fedora dockerfiles
cp -f images/base/Dockerfile $WORKINGDIR_ORIGIN/images/base/Dockerfile
cp -f images/builder/docker/docker-builder/Dockerfile $WORKINGDIR_ORIGIN/images/builder/docker/docker-builder/Dockerfile
cp -f images/cli/Dockerfile $WORKINGDIR_ORIGIN/images/cli/Dockerfile
cp -f images/egress/http-proxy/Dockerfile $WORKINGDIR_ORIGIN/images/egress/http-proxy/Dockerfile
cp -f images/egress/dns-proxy/Dockerfile $WORKINGDIR_ORIGIN/images/egress/dns-proxy/Dockerfile
cp -f images/egress/router/Dockerfile $WORKINGDIR_ORIGIN/images/egress/router/Dockerfile
cp -f images/hyperkube/Dockerfile $WORKINGDIR_ORIGIN/images/hyperkube/Dockerfile
cp -f images/hypershift/Dockerfile $WORKINGDIR_ORIGIN/images/hypershift/Dockerfile
cp -f images/ipfailover/keepalived/Dockerfile $WORKINGDIR_ORIGIN/images/ipfailover/keepalived/Dockerfile
cp -f images/node/Dockerfile $WORKINGDIR_ORIGIN/images/node/Dockerfile
cp -f images/origin/Dockerfile $WORKINGDIR_ORIGIN/images/origin/Dockerfile
cp -f images/pod/Dockerfile $WORKINGDIR_ORIGIN/images/pod/Dockerfile
cp -f images/router/haproxy/Dockerfile $WORKINGDIR_ORIGIN/images/router/haproxy/Dockerfile
cp -f images/router/nginx/Dockerfile $WORKINGDIR_ORIGIN/images/router/nginx/Dockerfile
cp -f images/router/f5/Dockerfile $WORKINGDIR_ORIGIN/images/router/f5/Dockerfile
cp -f images/source/Dockerfile $WORKINGDIR_ORIGIN/images/source/Dockerfile
cp -f images/template-service-broker/Dockerfile $WORKINGDIR_ORIGIN/images/template-service-broker/Dockerfile
cp -f images/tests/Dockerfile $WORKINGDIR_ORIGIN/images/tests/Dockerfile
pushd $WORKINGDIR_ORIGIN
hack/env hack/build-base-images.sh
hack/env make release


#rename containers
popd
