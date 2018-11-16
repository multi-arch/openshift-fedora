#!/bin/bash


#rename origin containers for testing and push
export PUSHPREFIX=${PUSHPREFIX:-docker.io/jeffdyoung/fedora-}
export arch=$(uname -m)
declare -a containers=(\
"origin-pod" \
"origin-template-service-broker" \
"origin-egress-router" \
"origin-keepalived-ipfailover" \
"origin-cli" \
"origin-hyperkube" \
"origin-hypershift" \
"origin-egress-dns-proxy" \
"origin-egress-http-proxy" \
"origin-tests" \
"origin-control-plane" \
"origin-recycler" \
"origin-f5-router" \
"origin-deployer" \
"origin-docker-builder" \
"origin-haproxy-router" \
"origin-node" \
"origin-service-catalog" \
"origin-web-console" \
"origin-docker-registry" \
"origin-etcd" \
"origin-cockpit" \
"origin-base" \
"origin-source" \
"origin-rpms" \
)

for container in "${containers[@]}"
do

	echo $PUSHPREFIX$container:v3.11.0.$arch
	docker push $PUSHPREFIX$container:v3.11.0.$arch	
done

