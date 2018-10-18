FROM fedora:28

ARG VERSION
ARG INSTALLER
ARG OFFLINE

ADD . /container
RUN /container/install.sh

CMD ["/usr/libexec/cockpit-kube-launch"]
