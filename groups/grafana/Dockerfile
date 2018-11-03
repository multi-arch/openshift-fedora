FROM openshift/origin-base

ENV GOPATH="/go"
ENV GOBIN="${GOPATH}/bin"
ENV PATH="${GOBIN}:${PATH}"
RUN mkdir -p $GOBIN

COPY . $GOPATH/src/github.com/grafana/grafana

RUN dnf install -y golang make git && \
    cd $GOPATH/src/github.com/grafana/grafana && \
    go run build.go build && \
    dnf erase -y golang make git && dnf clean all && \
    rm -rf .git

LABEL io.k8s.display-name="Grafana" \
      io.k8s.description="" \
      io.openshift.tags="openshift" \
      maintainer="Frederic Branczyk <fbranczy@redhat.com>"

# doesn't require a root user.
USER 1001

WORKDIR $GOPATH/src/github.com/grafana/grafana
RUN ls /go/src/github.com/grafana/grafana/bin/
ENTRYPOINT ["/go/src/github.com/grafana/grafana/bin/linux-$(GOHOSTARCH)/grafana-server"]
