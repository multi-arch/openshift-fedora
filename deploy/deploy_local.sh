#!/bin/bash

rm -rf /tmp/openshfit-ansible
git clone https://github.com/openshift/openshift-ansible.git /tmp/openshift-ansible
pushd /tmp/openshift-ansible
git checkout release-3.10
popd

pushd /tmp/openshift-ansible
