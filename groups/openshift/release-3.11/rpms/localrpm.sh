#!/bin/bash

export arch=$(uname -m)
rm -rf /tmp/origin-rpms
mkdir -p /tmp/origin-rpms

cp /tmp/origin/_output/local/releases/rpms/*.rpm /tmp/origin-rpms
cp /tmp/origin-web-console-server/_output/local/releases/rpms/*.rpm /tmp/origin-rpms
cp /tmp/image-registry/_output/local/releases/rpms/*.rpm /tmp/origin-rpms

docker build -t docker.io/jeffdyoung/fedora-origin-rpms:v3.11.0.$arch .
