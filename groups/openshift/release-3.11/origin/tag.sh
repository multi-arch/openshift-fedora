#!/bin/bash

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
)

for container in "${containers[@]}"
do

	echo $container
	export image_id=`docker images $container -q`
	NEWNAME=(`echo ${container} | sed 's/openshift\///g' | sed 's/\:latest//g'`)
	docker tag $container  $TESTPREFIX$NEWNAME:v3.10
        docker tag $container  $TESTPREFIX$NEWNAME:v3.10.0
        docker tag $container  $PUSHPREFIX$NEWNAME:v3.10.0.$arch
	
done
