#!/bin/bash

dnf install origin-clients origin-tests -y
#KUBECONFIG=/root/openshift.local.clusterup/kube-apiserver/admin.kubeconfig extended.test --ginkgo.v=true --ginkgo.focus="Suite\:openshift/conformance/parallel" --ginkgo.skip="k8s"
KUBECONFIG=/etc/origin/master/admin.kubeconfig /usr/libexec/origin/extended.test --ginkgo.v=true --ginkgo.focus="Suite\:openshift/conformance/parallel" 
