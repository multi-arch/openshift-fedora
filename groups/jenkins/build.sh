#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/jenkins
rm -rf /tmp/openshift
source repo.txt
#build origin base
git clone $REPO /tmp/jenkins
pushd /tmp/jenkins
pwd
git checkout $BRANCH
popd
pwd
cd /tmp/jenkins
