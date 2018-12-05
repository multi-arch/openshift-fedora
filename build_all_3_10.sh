#!/bin/bash

#create a local fedora:28 w/latest updates

pushd groups/fedorabase/
./build.sh 
popd

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


#rename origin containers for testing and push
export PUSHPREFIX=${PUSHPREFIX:-docker.io/jeffdyoung/fedora-}
export TESTPREFIX=${TESTPREFIX:-test/fedora-}
export arch=$(uname -m)
declare -a containers=(\
"openshift/origin-pod:latest" \
"openshift/origin-template-service-broker:latest" \
"openshift/origin-egress-router:latest" \
"openshift/origin-keepalived-ipfailover:latest" \
"openshift/origin-cli:latest" \
"openshift/origin-hyperkube:latest" \
"openshift/origin-hypershift:latest" \
"openshift/origin-egress-dns-proxy:latest" \
"openshift/origin-egress-http-proxy:latest" \
"openshift/origin-tests:latest" \
"openshift/origin-control-plane:latest" \
"openshift/origin-recycler:latest" \
"openshift/origin-f5-router:latest" \
"openshift/origin-deployer:latest" \
"openshift/origin-docker-builder:latest" \
"openshift/origin-haproxy-router:latest" \
"openshift/origin-node:latest" \
"openshift/origin-service-catalog:latest" \
"openshift/origin-web-console:latest" \
"openshift/origin-docker-registry:latest" \
"openshift/origin-etcd:latest" \
"openshift/origin-cockpit:latest" \
)

for container in "${containers[@]}"
do

	echo $container
	export image_id=`docker images $container -q`
	NEWNAME=(`echo ${container} | sed 's/openshift\///g' | sed 's/\:latest//g'`)
        docker tag $container  $TESTPREFIX$NEWNAME:v3.10.0
        docker tag $container  $PUSHPREFIX$NEWNAME:v3.10.0.$arch
	
done







