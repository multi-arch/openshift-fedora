#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/origin-release
rm -rf /tmp/openshift
source repo.txt
#build golang 1.10
git clone $REPO /tmp/origin-release
cp -f golang-1.10/Dockerfile /tmp/origin-release/projects/origin-release/golang-1.10/Dockerfile.fedora
cd /tmp/origin-release/projects/origin-release/golang-1.10/
docker build . -f Dockerfile.fedora  -t fedora-origin-release:golang-1.10
