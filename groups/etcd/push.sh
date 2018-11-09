#!/bin/bash
export arch=$(uname -m)
docker push docker.io/jeffdyoung/f28-origin-release:golang-1.10-$arch
docker push docker.io/jeffdyoung/f28-origin-release:golang-1.9-$arch
