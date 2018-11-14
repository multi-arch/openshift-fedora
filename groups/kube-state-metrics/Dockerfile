FROM openshift/origin-base

ENV GOPATH /go
RUN mkdir $GOPATH

COPY . $GOPATH/src/k8s.io/kube-state-metrics

RUN dnf install -y golang make git && \
   cd $GOPATH/src/k8s.io/kube-state-metrics && cat Makefile && \
   make build && cp $GOPATH/src/k8s.io/kube-state-metrics/kube-state-metrics /usr/bin/ && \
   dnf erase -y golang make && dnf clean all

LABEL io.k8s.display-name="kube-state-metrics" \
      io.k8s.description="This is a component that exposes metrics about Kubernetes objects." \
      io.openshift.tags="kubernetes" \
      maintainer="Frederic Branczyk <fbranczy@redhat.com>"

# doesn't require a root user.
USER 1001

ENTRYPOINT ["/usr/bin/kube-state-metrics"]
