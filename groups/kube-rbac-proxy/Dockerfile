FROM openshift/origin-base

ENV GOPATH /go
RUN mkdir $GOPATH

COPY . $GOPATH/src/github.com/brancz/kube-rbac-proxy

RUN dnf install -y golang make gcc && \
   cd $GOPATH/src/github.com/brancz/kube-rbac-proxy && \
   make build && cp $GOPATH/src/github.com/brancz/kube-rbac-proxy/_output/linux/`go env GOARCH`/kube-rbac-proxy /usr/bin/ && \
   dnf erase -y golang make && dnf clean all

LABEL io.k8s.display-name="kube-rbac-proxy" \
      io.k8s.description="This is a proxy, that can perform Kubernetes RBAC authorization." \
      io.openshift.tags="kubernetes" \
      maintainer="Frederic Branczyk <fbranczy@redhat.com>"

# doesn't require a root user.
USER 1001

ENTRYPOINT ["/usr/bin/kube-rbac-proxy"]
EXPOSE 8080
