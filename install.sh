#!/usr/bin/env bash
. .env
. ./net.sh

export KIND_EXPERIMENTAL_DOCKER_NETWORK=$NET_NAME

echo "installing cluster..."
# ToDo: toggle --image
kind create cluster --name $CLUSTER_NAME $NODE_IMAGE --config=cluster.yaml

echo ""
echo "---"
echo 'waiting for nodes get ready...'
kubectl wait nodes -l role=worker --for condition=ready
kubectl get nodes
kubectl cluster-info --context kind-${CLUSTER_NAME}
