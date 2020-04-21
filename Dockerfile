FROM golang:1.13 as builder
WORKDIR /go/src/github.com/openshift/bond-cni
COPY . .
RUN ./build.sh

FROM centos:latest
LABEL io.k8s.display-name="bond-cni" \
    io.k8s.description="This is an image containing the bond-cni executable" \
    io.openshift.tags="openshift"

COPY --from=builder /go/src/github.com/openshift/bond-cni/bin/bond /bondcni/bond
