#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_ALERT=${WORKINGDIR_ALERT:-/tmp/prometheus-alertmanager}
export BRANCH=${BRANCH:-release-3.11}
export REPO=${REPO:-https://github.com/openshift/prometheus-alertmanager.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_ALERT

git clone $REPO $WORKINGDIR_ALERT
pushd $WORKINGDIR_ALERT
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_ALERT/Dockerfile
cd $WORKINGDIR_ALERT
make build
docker build -t docker.io/jeffdyoung/fedora-prometheus-alertmanager:v3.11.0 -f Dockerfile .
