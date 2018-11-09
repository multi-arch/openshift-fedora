#!/bin/bash

#remove tmp things
rm -rf /tmp/openshift
rm -rf /tmp/origin
rm -rf /tmp/image-registry
rm -rf /tmp/origin-web-console-server
rm -rf /tmp/okdrpms


#clean and restart docker
docker rm -f $(docker ps -a -q)

docker rmi -f $(docker images -q)

docker system prune -f

systemctl docker start
