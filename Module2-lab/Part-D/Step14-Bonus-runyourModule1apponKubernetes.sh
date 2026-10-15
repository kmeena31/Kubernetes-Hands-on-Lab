#!/bin/bash
set -e  # Exit immediately if any command fails
# Goal: Run the image you pushed to Docker Hub in Module 1 on the cluster — every node pulls it from Docker Hub by itself.

# 1. Navigate to the working directory
cd "Module2-lab/Part-D/"

# 2. Dynamically create the deployment YAML manifest file
# demo-api.yaml

# 3. Apply the manifests and block until rollout finishes successfully
echo "====== Applying Manifests ======"
kubectl apply -f demo-api.yaml
kubectl rollout status deployment/demo-api

# 4. Show the running resources
echo "====== Resource Verification ======"
kubectl get pods -l app=demo-api -o wide
kubectl get service demo-api

# 5. Check which node's kubelet pulled the image
echo "====== Image Pull Verification ======"
kubectl get events --field-selector reason=Pulled -o custom-columns=NODE:.source.host,MESSAGE:.message

# 6. Port-forward in the background, query the endpoint, and clean up
echo "====== Testing App Endpoint ======"
kubectl port-forward service/demo-api 8080:80 >/dev/null 2>&1 &
PF_PID=$!

# Allow port-forward 3 seconds to bind to the local address securely
sleep 2

curl -s http://localhost:8080 ; echo
kubectl exec deploy/demo-api -- whoami

# Kill the background process so the runner doesn't hang
kill "$PF_PID"
