#!/bin/bash
#pull repo in /tmp
rm -rf /tmp/origin-release
rm -rf /tmp/openshift
docker volume prune -f
source repo.txt
export arch=$(uname -m)
#build golang 1.10
git clone $REPO /tmp/origin-release


#build 1.10 for most of origin
cp -f golang-1.10/Dockerfile.f29 /tmp/origin-release/projects/origin-release/golang-1.10/Dockerfile.fedora
cp -f golang-1.10/golang-v1.10.0-1.fc25.noarch.rpm /tmp/origin-release/projects/origin-release/golang-1.10/golang-v1.10.0-1.fc25.noarch.rpm
pushd /tmp/origin-release/projects/origin-release/golang-1.10/
docker build . -f Dockerfile.fedora  -t docker.io/jeffdyoung/fedora-origin-release:golang-1.10.$arch
popd

cp -f golang-1.9/Dockerfile.f29 /tmp/origin-release/projects/origin-release/golang-1.9/Dockerfile.fedora
cp -f golang-1.9/golang-v1.9.0-1.fc25.noarch.rpm /tmp/origin-release/projects/origin-release/golang-1.9/golang-v1.9.0-1.fc25.noarch.rpm
pushd /tmp/origin-release/projects/origin-release/golang-1.9/
docker build . -f Dockerfile.fedora  -t docker.io/jeffdyoung/fedora-origin-release:golang-1.9.$arch
popd

cp -f golang-1.11/Dockerfile.f29 /tmp/origin-release/projects/origin-release/golang-1.11/Dockerfile.fedora
cp -f golang-1.11/golang-v1.11.0-1.fc25.noarch.rpm /tmp/origin-release/projects/origin-release/golang-1.11/golang-v1.11.0-1.fc25.noarch.rpm
pushd /tmp/origin-release/projects/origin-release/golang-1.11/
docker build . -f Dockerfile.fedora  -t docker.io/jeffdyouny/fedora-origin-release:golang-1.11.$arch
popd
