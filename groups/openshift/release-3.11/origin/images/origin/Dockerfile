FROM openshift/origin-cli

RUN INSTALL_PKGS="origin ceph-common" && \
    dnf --enablerepo=origin-local-release install -y ${INSTALL_PKGS} && \
    dnf clean all && \
    setcap 'cap_net_bind_service=ep' /usr/bin/openshift

LABEL io.k8s.display-name="OpenShift Application Platform" \
      io.k8s.description="OpenShift is a platform for developing, building, and deploying containerized applications." \
      io.openshift.tags="openshift,core"

ENV HOME=/root \
    KUBECONFIG=/var/lib/origin/openshift.local.config/master/admin.kubeconfig

WORKDIR /var/lib/origin
EXPOSE 8443 53

ENTRYPOINT ["/usr/bin/openshift"]
