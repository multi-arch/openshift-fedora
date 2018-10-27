#!/bin/bash

dnf install createrepo -y
export arch=$(uname -m)
rm -rf /tmp/okdrpms
mkdir -p /tmp/okdrpms/$arch

cp /tmp/origin/_output/local/releases/rpms/*.rpm /tmp/okdrpms/$arch
cp /tmp/origin-web-console-server/_output/local/releases/rpms/*.rpm /tmp/okdrpms/$arch
cp /tmp/image-registry/_output/local/releases/rpms/*.rpm /tmp/okdrpms/$arch

createrepo /tmp/okdrpms

export testrepo=/etc/yum.repos.d/test310.repo
echo "[test3.10]" > $testrepo
echo "name=3.10 test repo" >> $testrepo
echo "baseurl=file:///tmp/okdrpms/">> $testrepo
echo "enabled=1">> $testrepo
echo "gpgcheck=0">> $testrepo
