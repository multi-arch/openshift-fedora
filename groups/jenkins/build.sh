#!/bin/bash
#pull repo in /tmp
JENKINS_VERSIONS="2 slave-base slave-maven slave-nodejs agent-nodejs-8 agent-maven-3.5"
rm -rf /opt/jenkins
rm -rf /opt/openshift
source repo.txt
#build origin base
BASE_DIR=$(pwd)
git clone $REPO /opt/jenkins
pushd /opt/jenkins
pwd
git checkout $BRANCH
for i in $JENKINS_VERSIONS; do
  cp $BASE_DIR/$i/Dockerfile $i/Dockerfile
  bash hack/build.sh fedora $i
done;
popd
pwd
