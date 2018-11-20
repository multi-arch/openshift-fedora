#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_NODE=${WORKINGDIR_NODE:-/tmp/sclorgnode8}
export BRANCH=${BRANCH:-master}
export REPO=${REPO:-https://github.com/sclorg/s2i-nodejs-container.git}

dnf -y install go-md2man

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_NODE

git clone --recursive  $REPO $WORKINGDIR_NODE
pushd $WORKINGDIR_NODE
pwd
git checkout $BRANCH
popd

pwd
cp -f nodejs8/Dockerfile $WORKINGDIR_NODE/8/Dockerfile.fedora
pushd $WORKINGDIR_NODE
git submodule update --init
make build TARGET=fedora VERSIONS=8
