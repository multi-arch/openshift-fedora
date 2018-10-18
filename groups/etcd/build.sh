#!/bin/bash
#pull repo in /tmp
#rm -rf /tmp/etcd
#source repo.txt
#export arch=$(uname -m)
#build golang 1.10
#git clone $REPO /tmp/etcd
#build 1.10 for most of origin
#pushd /tmp/etcd/
docker volume prune -f
cd build
docker build -t openshift/etcd .
