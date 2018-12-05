#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_SCLORGCORE=${WORKINGDIR_SCLORGCORE:-/tmp/sclorgcore}
export BRANCH=${BRANCH:-master}
export REPO=${REPO:-https://github.com/sclorg/s2i-base-container.git}

dnf -y install go-md2man

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_SCLORGCORE

git clone --recursive  $REPO $WORKINGDIR_SCLORGCORE
pushd $WORKINGDIR_SCLORGCORE
pwd
git checkout $BRANCH
popd

pwd
cp -f core/Dockerfile $WORKINGDIR_SCLORGCORE/core/Dockerfile.fedora
cp -f base/Dockerfile $WORKINGDIR_SCLORGCORE/base/Dockerfile.fedora
pushd $WORKINGDIR_SCLORGCORE
git submodule update --init
make build TARGET=fedora
