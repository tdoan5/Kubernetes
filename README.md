# Kubernetes

### Cloud Computing class

http://storm.cis.fordham.edu/ji/cisc5550/homework.html

1.  Create a Dockerfile for Flask web app

2.	Under the directory containing Docker file and all needed files for app, create a docker image:

`docker build -t tdoan5/cs5550-demo .`

3.	Push the docker image to Docker hub using your docker account:

`docker push tdoan5/cs5550-demo .`

4. Create Kubernetes cluster using deploy_kubernetes.sh script

5. LoadBalancer service will stays in pending status in about 30-60sec before getting the external-ip assigned. After 30s – 60s, we can call follow command to get external-ip and test the deployed app:

`kubectl get service cc5550`
