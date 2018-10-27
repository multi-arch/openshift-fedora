#!/bin/bash

docker system prune -f
docker build -t fedora:local .

docker tag fedora:local fedora:28
docker tag fedora:local docker.io/fedora:28
