gcloud services enable container.googleapis.com

gcloud container clusters create todoapp-cluster

kubectl run cc5550 --image=tdoan5/cs5550-demo --port=5000

kubectl expose deployment cc5550 --type=LoadBalancer --port 80 --target-port 5000
