FROM openshift/origin-base

ENV GOPATH /go
ENV CC=gcc
RUN mkdir -p $GOPATH/bin

COPY . $GOPATH/src/github.com/jimmidyson/configmap-reload

RUN yum install -y golang make git && \
   cd $GOPATH/src/github.com/jimmidyson/configmap-reload && \
   PATH=$PATH:$GOPATH/bin make out/configmap-reload-linux-`go env GOARCH` GOPATH=$GOPATH && cp $GOPATH/src/github.com/jimmidyson/configmap-reload/out/configmap-reload-linux-`go env GOARCH` /usr/bin/configmap-reload && \
   yum erase -y golang make && yum clean all

LABEL io.k8s.display-name="configmap reload" \
      io.k8s.description="This is a component reloads another process if a configured configmap volume is remounted." \
      io.openshift.tags="kubernetes" \
      maintainer="Frederic Branczyk <fbranczy@redhat.com>"

# doesn't require a root user.
USER 1001

ENTRYPOINT ["/usr/bin/configmap-reload"]
