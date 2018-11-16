#!/bin/bash

docker system prune -f
docker build -t fedora:local .  -f Dockerfile

docker tag fedora:local fedora:29
docker tag fedora:local docker.io/fedora:29
