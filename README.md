# Kubernetes

### Cloud Computing class

http://storm.cis.fordham.edu/ji/cisc5550/homework.html

### Project to deploy web app on Kubernetes (web service uses DbaaS MongoDB mLab for data persistence)

As Kubernetes YAML file does not allow to pull a private DockerHub hosted image, we will create a `setupkey.sh` script to pull the DockerHub image through `DOCKER_REGISTRY_SERVER`.

We have to set DockerHub username, email, and password in the `setupkey.sh`. (command lines 2-4)

Run `setupkey.sh`


#### I. Use a VM instace for web API, deploy only web app on Kubernetes (see `test.sh`) 

1. All files needed for this test are:

- test.sh
- todo-deployment.yaml
- todo-service.yaml
- startup.sh 
- Dockerfile
- todolist.py
- todolist_api.py

2. Two static external IPs are reserved for this project. You can see those IPs in the `todo-deployment.yaml` and `todo-service.yaml` files. 

To reserve external IP address:

https://console.cloud.google.com/networking/addresses/

3. Deploy web API and web app using `test.sh` script. 

#### II. Test deploying web API and web app on different pods on Kubernetes cluster (see `test_two_pods.sh`)

1. Both Docker web API and web app images are pushed to DockerHub, so I will not include the Docker build and push in the `test_two_pods.sh` script.

2. Combine `todo-deployment.yaml` and `todo-service.yaml` (used in part I) into 1 YAML file called `todo-deployment-service.yaml` for deploying web app.

3. Create `todoapi-deployment-service.yaml` for deploying web API service.

4. Run `test_two_pods.sh`

#### III. Test creating a frontend that connects to the backend worker Pods by using the DNS name given to the backend Service

