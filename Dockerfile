FROM rawmind/alpine-base:0.3.3-2
MAINTAINER Raul Sanchez <rawmind@gmail.com>

ENV SERVICE_VERSION=v2.2.5
ENV SERVICE_URL=https://github.com/coreos/etcd/releases/download/${SERVICE_VERSION}/etcd-${SERVICE_VERSION}-linux-amd64.tar.gz

RUN curl -jksSL ${SERVICE_URL} | tar zx && \
    mv etcd-${SERVICE_VERSION}-linux-amd64 etcd

WORKDIR /data

EXPOSE 4001 7001

ENTRYPOINT ["/etcd/etcd"]
