[![](https://images.microbadger.com/badges/image/rawmind/alpine-etcd.svg)](https://microbadger.com/images/rawmind/alpine-etcd "Get your own image badge on microbadger.com")

alpine-etcd 
==============

This image is the etcd base. It comes from [alpine-monit][alpine-monit].

## Build

```
docker build -t rawmind/alpine-etcd:<version> .
```

## Versions

- `2.3.7-5` [(Dockerfile)](https://github.com/rawmind0/alpine-etcd/blob/2.3.7-5/Dockerfile)
- `2.2.5-0` [(Dockerfile)](https://github.com/rawmind0/alpine-etcd/blob/2.2.5-0/Dockerfile)

## Configuration

This image runs [ectd][etcd] with monit. Etcd is started with user and group "etcd".

Besides, you can customize the configuration in several ways:

### Default Configuration

Etcd is installed with the default configuration and some parameters can be overrided with env variables:

- ETCD_ADVERTISE_CLIENT_URLS=${ETCD_ADVERTISE_CLIENT_URLS:-"http://localhost:2379"}
- ETCD_DATA_DIR=${ETCD_DATA_DIR:-${SERVICE_HOME}"/data"}
- ETCD_INITIAL_ADVERTISE_PEER_URLS=${ETCD_INITIAL_ADVERTISE_PEER_URLS:-http://localhost:2380}
- ETCD_INITIAL_CLUSTER=${ETCD_INITIAL_CLUSTER:-"local=http://localhost:2380"}
- ETCD_INITIAL_CLUSTER_STATE=${ETCD_INITIAL_CLUSTER_STATE:-"new"}
- ETCD_INITIAL_CLUSTER_TOKEN=${ETCD_INITIAL_CLUSTER_TOKEN:-"dev-cluster"}
- ETCD_NAME=${ETCD_NAME:-"local"}
- ETCD_LISTEN_PEER_URLS=${ETCD_LISTEN_PEER_URLS:-"http://0.0.0.0:2380"}
- ETCD_LISTEN_CLIENT_URLS=${ETCD_LISTEN_CLIENT_URLS:-"http://0.0.0.0:2379"}


### Custom Configuration

Etcd is installed under /opt/etcd and make use of /opt/etcd/bin/etcd-source.sh to generate env variables.

You can edit this files in order customize configuration

You could also include FROM rawmind/alpine-etcd at the top of your Dockerfile, and add your custom config.

### Rancher

If you are running it in rancher, you could run [rancher-etcd][rancher-etcd] as a sidekick to get dynamic configuration.


## Example

See [rancher-example][rancher-example], that run zookeeper in a rancher system with dynamic configuration.


[alpine-monit]: https://github.com/rawmind0/alpine-monit/
[etcd]: https://github.com/coreos/etcd
[rancher-etcd]: https://hub.docker.com/r/rawmind/rancher-etcd/
[rancher-example]: https://github.com/rawmind0/alpine-etcd/tree/master/rancher
