#!/bin/bash

export arch=$(uname -m)
export WORKINGDIR_GRAFANA=${WORKINGDIR_GRAFANA:-/tmp/grafana}
export BRANCH=${BRANCH:-openshift-master}
export REPO=${REPO:-https://github.com/openshift/grafana.git}

#pull repo in /tmp
docker volume prune -f
rm -rf $WORKINGDIR_GRAFANA

git clone $REPO $WORKINGDIR_GRAFANA
pushd $WORKINGDIR_GRAFANA
pwd
git checkout $BRANCH
popd

pwd
cp -f Dockerfile $WORKINGDIR_GRAFANA/Dockerfile
cd $WORKINGDIR_GRAFANA
docker build -t openshift/origin-grafana:latest -f Dockerfile .
