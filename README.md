# Kubernetes

### Cloud Computing class

http://storm.cis.fordham.edu/ji/cisc5550/homework.html

#### Final

1. As Kubernetes YAML file does not allow to pull a private DockerHub hosted image, we will create a `setupkey.sh` script to pull the DockerHub image through `DOCKER_REGISTRY_SERVER`.

We have to set DockerHub username, email, and password in the `setupkey.sh`. (command lines 2-4)

2. I reserved 2 static external IPs for this project. As it's not easy to automate passing IPs to YAML files, I hardcode the IPs into `todo-deployment.yaml` and `todo-service.yaml` files. 

3. Deploy web API and web app using `test.sh` script. 
