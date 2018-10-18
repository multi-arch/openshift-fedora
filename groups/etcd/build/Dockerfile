FROM fedora:28


ENV container=docker
RUN dnf -y install etcd hostname && dnf clean all

LABEL install /usr/bin/docker run --rm \$OPT1 --privileged -v /:/host -e HOST=/host -e NAME=\$NAME -e IMAGE=\$IMAGE \$IMAGE \$OPT2 /usr/bin/install.sh  \$OPT3
LABEL uninstall /usr/bin/docker run --rm \$OPT1 --privileged -v /:/host -e HOST=/host -e NAME=\$NAME -e IMAGE=\$IMAGE \$IMAGE \$OPT2 /usr/bin/uninstall.sh \$OPT3
LABEL run /usr/bin/docker run -d \$OPT1 -p 4001:4001 -p 7001:7001 -p 2379:2379 -p 2380:2380 --name \$NAME \$IMAGE \$OPT2 \$OPT3

ADD etcd_container_template.service /etc/systemd/system/etcd_container_template.service
ADD etcd-env.sh /usr/bin/etcd-env.sh
ADD install.sh  /usr/bin/install.sh
ADD uninstall.sh /usr/bin/uninstall.sh

EXPOSE 4001 7001 2379 2380

ADD tmpfiles.template config.json.template service.template manifest.json /exports/

CMD ["/usr/bin/etcd-env.sh", "/usr/bin/etcd"]
