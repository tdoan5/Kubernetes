# Kubernetes

### Cloud Computing class

http://storm.cis.fordham.edu/ji/cisc5550/homework.html

#### Project to deploy web app on Kubernetes (web service uses DbaaS MongoDB mLab for data persistence)

1. As Kubernetes YAML file does not allow to pull a private DockerHub hosted image, we will create a `setupkey.sh` script to pull the DockerHub image through `DOCKER_REGISTRY_SERVER`.

We have to set DockerHub username, email, and password in the `setupkey.sh`. (command lines 2-4)

Run `setupkey.sh`

2. Two static external IPs are reserved for this project. You can see those IPs in the `todo-deployment.yaml` and `todo-service.yaml` files. 

To reserve external IP address:

https://console.cloud.google.com/networking/addresses/

3. Deploy web API and web app using `test.sh` script. 
