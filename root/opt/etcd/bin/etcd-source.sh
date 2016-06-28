#!/usr/bin/env bash

cat << EOF > ${SERVICE_CONF}
export ETCD_ADVERTISE_CLIENT_URLS=\${ETCD_ADVERTISE_CLIENT_URLS:-"http://localhost:2379"}
export ETCD_DATA_DIR=\${ETCD_DATA_DIR:-\${SERVICE_HOME}"/data"}
export ETCD_INITIAL_ADVERTISE_PEER_URLS=\${ETCD_INITIAL_ADVERTISE_PEER_URLS:-http://localhost:2380}
export ETCD_INITIAL_CLUSTER=\${ETCD_INITIAL_CLUSTER:-"local=http://localhost:2380"}
export ETCD_INITIAL_CLUSTER_STATE=\${ETCD_INITIAL_CLUSTER_STATE:-"new"}
export ETCD_INITIAL_CLUSTER_TOKEN=\${ETCD_INITIAL_CLUSTER_TOKEN:-"dev-cluster"}
export ETCD_NAME=\${ETCD_NAME:-"local"}
export ETCD_LISTEN_PEER_URLS=\${ETCD_LISTEN_PEER_URLS:-"http://0.0.0.0:2380"}
export ETCD_LISTEN_CLIENT_URLS=\${ETCD_LISTEN_CLIENT_URLS:-"http://0.0.0.0:2379"}
EOF

