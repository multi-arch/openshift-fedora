#!/bin/bash

dnf install libsemanage-python3 -y

rm -rf /tmp/openshift-ansible
git clone https://github.com/openshift/openshift-ansible.git /tmp/openshift-ansible
pushd /tmp/openshift-ansible
git checkout release-3.10
pip install -r requirements.txt 
pip3 install -r requirements.txt 
popd

#pushd /tmp/openshift-ansible
