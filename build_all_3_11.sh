#!/bin/bash

#create a local fedora:29 w/latest updates

pushd groups/fedorabase/
./build.sh 
popd

pushd groups/openshift/release-3.11/origin
./build.sh
popd

pushd groups/openshift/release-3.11/image-registry
./build.sh
popd

pushd groups/openshift/release-3.11/origin-web-console-server
./build.sh
popd

pushd groups/openshift/release-3.11/service-catalog
./build.sh
popd


pushd groups/cockpit 
./build.sh
popd

pushd groups/etcd
./build.sh
popd



### 
#pushd groups/grafana
#./build.sh
#popd

#pushd groups/kube-rbac-proxy
#./build.sh
#popd

#pushd groups/kube-state-metrics
#./build.sh
#popd

#pushd groups/prometheus-node-exporter
#./build.sh
#popd

#pushd groups/prometheus-operator
#./build.sh
#popd

#pushd groups/cluster-monitoring-operator
#./build.sh
#popd

#WIP needs to be built with builah golang:nodejs and needs nodejs8 from scl
#pushd groups/openshift/release-3.11/console
#./build.sh
#popd

#WIP needs to be built with buildah
#pushd groups/oauth-proxy
#./build.sh
#popd

#WIP needs to be built with buildah
#pushd groups/prometheus
#./build.sh
#popd

#WIP 
#pushd groups/prometheus-alertmanager
#./build.sh
#popd


#WIP
#pushd groups/jenkins
#./build.sh
#popd

#build apache container to deliver rpms
pushd groups/openshift/release-3.11/rpms
./build.sh
popd

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
"openshift/origin-base:latest" \
"openshift/origin-source:latest" \
)

for container in "${containers[@]}"
do

	echo $container
	export image_id=`docker images $container -q`
	NEWNAME=(`echo ${container} | sed 's/openshift\///g' | sed 's/\:latest//g'`)
        docker tag $container  $TESTPREFIX$NEWNAME:v3.11.0
        docker tag $container  $PUSHPREFIX$NEWNAME:v3.11.0.$arch
	
done







