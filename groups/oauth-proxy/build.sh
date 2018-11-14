#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_OAUTH=${WORKINGDIR_OAUTH:-/tmp/oauth-proxy}
export BRANCH=${BRANCH:-master}
export REPO=${REPO:-https://github.com/openshift/oauth-proxy.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_OAUTH

git clone $REPO $WORKINGDIR_OAUTH
pushd $WORKINGDIR_OAUTH
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_OAUTH/Dockerfile
cd $WORKINGDIR_OAUTH
docker build -t docker.io/jeffdyoung/fedora-oauth-proxy:v3.11.0 -f Dockerfile .
