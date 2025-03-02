#!/bin/bash

# install kind and set provider to podman
export KIND_EXPERIMENTAL_PROVIDER=podman

# create a kind cluster, this will start the kubernetes cluster
kind create cluster

# verify if this cluser is running
kubectl cluster-info --context kind-kind

# install tekton pipelines
curl https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml -o tekton-release.yaml
kubectl apply --filename tekton-release.yaml

# install the tekton dashboard
curl https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml -o tekton-dashboard-release.yaml
kubectl apply --filename tekton-dashboard-release.yaml

# forward the tekton dashboard to localhost
kubectl port-forward svc/tekton-dashboard 9097:9097 --namespace tekton-pipelines

# Dashboard is now available at http://localhost:9097

