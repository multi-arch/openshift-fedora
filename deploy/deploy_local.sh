#!/bin/bash

rm -rf /tmp/openshfit-ansible
git clone https://github.com/openshift/openshift-ansible.git /tmp/openshift-ansible
pushd /tmp/openshift-ansible
git checkout release-3.10
popd

cp hosts.localtest /tmp/openshift-ansbile
pushd /tmp/openshift-ansible
ansible-playbook -i /tmp/openshift-ansible/hosts.localtest 
