FROM openshift/origin-source

RUN INSTALL_PKGS="origin-service-catalog" && \
    dnf --enablerepo=origin-local-release install -y ${INSTALL_PKGS} && \
    dnf clean all

CMD [ "/usr/bin/service-catalog" ]
