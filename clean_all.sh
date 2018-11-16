#!/bin/bash

#remove tmp things
rm -rf /tmp/openshift
rm -rf /tmp/origin
rm -rf /tmp/image-registry
rm -rf /tmp/origin-web-console-server
rm -rf /tmp/okdrpms
rm -rf /tmp/cluster-monitoring-operator  
rm -rf /tmp/kube-rbac-proxy     
rm -rf /tmp/origin-release             
rm -rf /tmp/service-catalog
rm -rf /tmp/cockpit
rm -rf /tmp/kube-state-metrics  
rm -rf /tmp/origin-rpms
rm -rf /tmp/grafana
rm -rf /tmp/prometheus-operator 

#clean and restart docker
docker rm -f $(docker ps -a -q)

docker rmi -f $(docker images -q)

docker system prune -f

systemctl docker start
