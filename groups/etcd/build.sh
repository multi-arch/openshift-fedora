#!/bin/bash

export ETCD_NAME=${ETCD_NAME:-openshift/origin-etcd:latest}
export arch=$(uname -m)
docker volume prune -f
cd build
echo $arch
if [ $arch == 'aarch64'] 
then
	docker build -t $ETCD_NAME . -f Dockerfile.aarch64
elif [ $arch == 's390x' ]
then
	docker build -t $ETCD_NAME . -f Dockerfile.s390x
else 
        docker build -t $ETCD_NAME .
fi
