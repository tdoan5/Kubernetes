#!/bin/bash
# to not forget login into docker hub
docker login
# if docker can login, then proceed
gcloud config set project instant-diorama-198117
gcloud compute instances delete cisc5550-api
gcloud compute firewall-rules delete rule-allow-tcp-5001

# export the static external IP

export TODO_API_IP=`gcloud compute addresses list --filter="name=todo-api-ip" --format="value(ADDRESS)"`

gcloud compute instances create cisc5550-api --address $TODO_API_IP  --machine-type n1-standard-1 --image-family debian-9 --image-project debian-cloud --tags http-server --metadata-from-file startup-script=./startup.sh
gcloud compute firewall-rules create rule-allow-tcp-5001 --source-ranges 0.0.0.0/0 --target-tags http-server --allow tcp:5001

#export TODO_API_IP=`gcloud compute instances list --filter="name=cisc5550-api" --format="value(EXTERNAL_IP)"`

# next, deploy the app that depends on api
docker build -t tdoan5/cc5550todoapp:v1 .
# need docker login
docker push tdoan5/cc5550todoapp:v1

gcloud container clusters create cisc5550-cluster
#kubectl run cc5550 --image=tdoan5/cc5550todoapp:v1 --env="TODO_API_IP=$TODO_API_IP" --port=5000

kubectl apply -f todo-deployment.yaml

#export TODO_IP=`gcloud compute addresses list --filter="name=todo-ip" --format="value(ADDRESS)"`
#kubectl expose deployment cc5550 --type="LoadBalancer" --port=80 --target-port=5000
kubectl apply -f todo-service.yaml

#kubectl get service cc5550
kubectl get service
