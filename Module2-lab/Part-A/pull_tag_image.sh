#!/bin/bash
set -e  # Exit immediately if any command fails

# 1. Pull the image from your Docker Hub repository
docker pull meenakande/module1-demo-api:1.0.0
          
echo "Step 2: Tagging App Image"
# 2. (Optional) Create a local tag if subsequent scripts need the short name
docker tag meenakande/module1-demo-api:1.0.0 module1-demo-api:1.0.0
          
echo "Step 3: Verifying App Image"
# 3. Verify the image is locally available on the runner
docker images

echo "Step 4: Installing Kind & nginx packages"
# 4. Install Kind & nginx packages"
echo "Installing Kind package"
docker pull kindest/node:v1.37.0
          
echo "Installing Kind package" 
docker pull nginx:1.28-alpine
            
echo "Step 5: Verifying Kind & nginx installation"
# 5. Verifying Kind & nginx installation
kubectl version --client
kind version
docker info --format '{{.ServerVersion}}'
         
          
         