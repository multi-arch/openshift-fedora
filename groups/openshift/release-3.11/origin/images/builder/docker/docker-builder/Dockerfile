FROM openshift/origin-cli

RUN INSTALL_PKGS=" \
      which tar wget hostname  util-linux \
      socat tree findutils lsof bind-utils \
      git tar bsdtar \
      " && \
    dnf install -y ${INSTALL_PKGS} && \
    #rpm -V ${INSTALL_PKGS} && \
    dnf clean all

LABEL io.k8s.display-name="OpenShift Origin Builder" \
      io.k8s.description="This is a component of OpenShift Origin and is responsible for executing image builds." \
      io.openshift.tags="openshift,builder"
ENTRYPOINT ["/usr/bin/openshift-docker-build"]
