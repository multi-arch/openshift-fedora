FROM docker.io/jeffdyoung/fedora-origin-release:golang-1.10-x86_64  AS build
COPY . /go/src/github.com/openshift/oauth-proxy
RUN cd /go/src/github.com/openshift/oauth-proxy && go build .
FROM fedora:29
COPY --from=build /go/src/github.com/openshift/oauth-proxy/oauth-proxy /bin/oauth-proxy
ENTRYPOINT ["/bin/oauth-proxy"]
