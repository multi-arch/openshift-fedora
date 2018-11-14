FROM        fedora:29 
MAINTAINER  The Prometheus Authors <prometheus-developers@googlegroups.com>

COPY node_exporter /bin/node_exporter

EXPOSE      9100
USER        nobody
ENTRYPOINT  [ "/bin/node_exporter" ]
