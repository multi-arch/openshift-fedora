FROM openshift/origin-source

RUN INSTALL_PKGS="origin-template-service-broker" && \
    dnf --enablerepo=origin-local-release install -y ${INSTALL_PKGS} && \
    rpm -V ${INSTALL_PKGS} && \
    dnf clean all

CMD [ "/usr/bin/template-service-broker" ]
