#!/bin/bash
set -e  # Exit immediately if any command fails

cd module1-lab/demo-api/
DOCKERHUB_USER=meenakande     # learners: your own Docker Hub user name

# 1. Log in directly using the token/password
docker login -u "$DOCKERHUB_USER" -p "$DOCKERHUB_TOKEN"
            
# 2. Tag the images
docker tag module1-demo-api:1.0.0 $DOCKERHUB_USER/module1-demo-api:1.0.0
docker tag module1-demo-api:1.0.0 $DOCKERHUB_USER/module1-demo-api:sha-a1b2c3d

# 3. Push the images
# 4. List remote tags to verify
curl -s "https://hub.docker.com/v2/namespaces/$DOCKERHUB_USER/repositories/module1-demo-api/tags" | grep -o '"name":"[^"]*"'

# 4. List remote tags to verify
curl -s "https://hub.docker.com/v2/namespaces/$DOCKERHUB_USER/repositories/module1-demo-api/tags" | grep -o '"name":"[^"]*"'
            
#5. Delete the local copy and pull it back from Docker Hub
docker image rm $DOCKERHUB_USER/module1-demo-api:1.0.0
docker pull $DOCKERHUB_USER/module1-demo-api:1.0.0