#!/bin/bash
# to deploy web API and web app on two different pods
# app cc5550 listens to static extenal IP address of service cc5550api 

gcloud config set project instant-diorama-198117

# combine deployment and expose serive in one YAML file
kubectl apply -f todoapi-deployment-service.yaml

# combine deployment and expose serive in one YAML file
kubectl apply -f todo-deployment-service.yaml

kubectly get pod

kubectl get service
