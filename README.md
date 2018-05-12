# Kubernetes

### Cloud Computing class

http://storm.cis.fordham.edu/ji/cisc5550/homework.html

### Project to deploy web app on Kubernetes (web service uses DbaaS MongoDB mLab for data persistence)

- As Kubernetes YAML file does not allow to pull a private DockerHub hosted image, we will create a `setupkey.sh` script to pull the DockerHub image through DOCKER_REGISTRY_SERVER `index.docker.io`.

We have to set DockerHub username, email, and password in the `setupkey.sh`. (command lines 2-4)

Run `setupkey.sh`

- Two static external IPs are reserved for this project. You can see those IPs in the `todo-deployment.yaml` and `todo-service.yaml` files. 

35.231.172.37: will be used for web API

35.231.34.19: will be used for web app

To reserve external IP address:

https://console.cloud.google.com/networking/addresses/

#### I. Use a VM instace for web API, deploy only web app on Kubernetes (see `test.sh`) 

1. All files needed for this test are:

- test.sh
- todo-deployment.yaml
- todo-service.yaml
- startup.sh 
- Dockerfile
- todolist.py
- todolist_api.py
- templates/index.html

2. Deploy web API and web app using `test.sh` script. 

#### II. Test deploying web API and web app on different pods on Kubernetes cluster (see `test_two_pods.sh`)

Files needed for this test are:

- test_two_pods.sh
- todo-deployment-service.yaml
- todoapi-deployment-service.yaml
- tdoan5/cc5550todoapi:v1 (Docker todoapp API image)
- tdoan5/cc5550todoapp:v1 ((Docker todoapp image)

1. Both Docker web API and web app images are pushed to DockerHub, so I will not include the Docker build and push in the `test_two_pods.sh` script.

2. Combine `todo-deployment.yaml` and `todo-service.yaml` (used in part I) into 1 YAML file called `todo-deployment-service.yaml` for deploying web app.

3. Create `todoapi-deployment-service.yaml` for deploying web API service.

4. Run `test_two_pods.sh`

#### III. Test creating a frontend that connects to the backend worker Pods by using the DNS name given to the backend Service

