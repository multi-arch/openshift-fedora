#!/bin/bash

#Create yaml files


declare -a containers=(\
"pod" \
"template-service-broker" \
"egress-router" \
"keepalived-ipfailover" \
"cli" \
"hyperkube" \
"hypershift" \
"egress-dns-proxy" \
"egress-http-proxy" \
"tests" \
"control-plane" \
"recycler" \
"f5-router" \
"deployer" \
"docker-builder" \
"haproxy-router" \
"node" \
"service-catalog" \
"web-console" \
"docker-registry" \
"etcd" \
"cockpit" \
"base" \
"source" \
)

export manifestdir=/tmp/manifest
rm -rf $manifestdir
mkdir $manifestdir

for container in "${containers[@]}"
do

	echo $container
	echo "image: docker.io/jeffdyoung/fedora-origin-$container:v3.11.0" > $manifestdir/fedora-origin-$container.yaml 
        echo "manifests:" >> $manifestdir/fedora-origin-$container.yaml
	echo "  -" >> $manifestdir/fedora-origin-$container.yaml
        echo "    image: docker.io/jeffdyoung/fedora-origin-$container:v3.11.0.ppc64le" >> $manifestdir/fedora-origin-$container.yaml
        echo "    platform:" >> $manifestdir/fedora-origin-$container.yaml
        echo "      architecture: ppc64le" >> $manifestdir/fedora-origin-$container.yaml
        echo "      os: linux" >> $manifestdir/fedora-origin-$container.yaml
        echo "  -" >> $manifestdir/fedora-origin-$container.yaml
        echo "    image: docker.io/jeffdyoung/fedora-origin-$container:v3.11.0.x86_64" >> $manifestdir/fedora-origin-$container.yaml
        echo "    platform:" >> $manifestdir/fedora-origin-$container.yaml
        echo "      architecture: amd64" >> $manifestdir/fedora-origin-$container.yaml
        echo "      os: linux" >> $manifestdir/fedora-origin-$container.yaml
        echo "  -" >> $manifestdir/fedora-origin-$container.yaml
        echo "    image: docker.io/jeffdyoung/fedora-origin-$container:v3.11.0.aarch64" >> $manifestdir/fedora-origin-$container.yaml
        echo "    platform:" >> $manifestdir/fedora-origin-$container.yaml
        echo "      architecture: arm64" >> $manifestdir/fedora-origin-$container.yaml
        echo "      os: linux" >> $manifestdir/fedora-origin-$container.yaml
        echo "  -" >> $manifestdir/fedora-origin-$container.yaml
        echo "    image: docker.io/jeffdyoung/fedora-origin-$container:v3.11.0.s390x" >> $manifestdir/fedora-origin-$container.yaml
        echo "    platform:" >> $manifestdir/fedora-origin-$container.yaml
        echo "      architecture: s390x" >> $manifestdir/fedora-origin-$container.yaml
        echo "      os: linux" >> $manifestdir/fedora-origin-$container.yaml
	
 	
	#./manifest-tool-linux-amd64 push from-spec $manifestdir/fedora-origin-$container.yaml	
done
