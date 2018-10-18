#!/bin/bash
#pull repo in /tmp
docker volume prune -f
rm -rf /tmp/cockpit
source repo.txt
export arch=$(uname -m)
#build service-catalog

git clone $REPO /tmp/cockpit
pushd /tmp/cockpit
pwd
git checkout $BRANCH
popd

pwd
cp -f containers/kubernetes/Dockerfile /tmp/cockpit/containers/kubernetes/Dockerfile
cd /tmp/cockpit/containers/kubernetes
docker build -t kubernetes/cockpit -f Dockerfile .
