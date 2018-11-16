#!/bin/bash


pushd groups/fedorabase/
./build.sh 
popd


pushd groups/origin-release/
./build.sh
popd
