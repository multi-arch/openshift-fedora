#!/bin/sh

# Create Container
chroot ${HOST} /usr/bin/docker create -p 4001:4001 -p 7001:7001 -p 2379:2379 -p 2380:2380 --name ${NAME} ${IMAGE}

# Install systemd unit file for running container
sed -e "s/TEMPLATE/${NAME}/g" /etc/systemd/system/etcd_container_template.service > ${HOST}/etc/systemd/system/etcd_container_${NAME}.service

# restore selinux context
chroot ${HOST} /usr/sbin/restorecon -v /etc/systemd/system/etcd_container_${NAME}.service

# Enable systemd unit file
chroot ${HOST} /usr/bin/systemctl enable etcd_container_${NAME}.service
