#!/bin/bash

export ETCD_NAME=${ETCD_NAME:-openshift/origin-etcd:latest}
docker volume prune -f
cd build
docker build -t $ETCD_NAME .
