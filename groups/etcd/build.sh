#!/bin/bash
export arch=$(uname -m)

export ETCD_NAME=${ETCD_NAME:-docker.io/jeffdyoung/etcd:3.2.$arch}
docker volume prune -f
cd build
docker build -t $ETCD_NAME .
