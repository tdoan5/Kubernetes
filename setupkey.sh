DOCKER_REGISTRY_SERVER=https://index.docker.io/v1/
DOCKER_USER=username
DOCKER_EMAIL=email
DOCKER_PASSWORD=password

kubectl create secret docker-registry myregistrykey \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL
