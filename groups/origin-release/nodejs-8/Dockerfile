#FROM openshift/origin-release:golang-1.10
FROM docker.io/jeffdyoung/fedora-origin-release:golang-1.10

#FROM centos/nodejs-8-centos7
FROM docker.io/jeffdyoung/fedora-nodejs-8
COPY --from=0 /usr/bin/clonerefs /usr/bin/clonerefs
USER root
ENV PATH=$PATH:/opt/rh/rh-nodejs8/root/usr/bin
RUN mkdir -p /go && \
    chmod g+xw -R /go
