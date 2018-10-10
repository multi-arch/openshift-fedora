#!/bin/bash

pushd groups/release-3.10/origin-release
./build.sh
popd

pushd groups/release-3.10/origin
./build.sh
popd


pushd groups/release-3.10/image-registry
./build.sh
popd


pushd groups/release-3.10/origin-web-console-server
./build.sh
popd
