#!/bin/bash

pushd groups/openshift/release-3.10/origin
./build.sh
popd


pushd groups/openshift/release-3.10/image-registry
./build.sh
popd


pushd groups/openshift/release-3.10/origin-web-console-server
./build.sh
popd

pushd groups/openshift/release-3.10/service-catalog
./build.sh
popd


pushd groups/cockpit 
./build.sh
popd

pushd groups/etcd
./build.sh
popd

#pushd groups/jenkins
#./build.sh
#popd
