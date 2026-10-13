#!/bin/bash
set -e 
#Trainers: pre-load the lab images into the kind cluster before class
#1. Ensure the 'lab' cluster exists
if ! kind get clusters | grep -q "^lab$"; then
  echo "Cluster 'lab' not found. Creating it now..."
    bash Module2-lab/Part-A/Step2-create3nodecluster.sh
fi

# 2. Pre-load images
PLATFORM=$(docker version --format '{{.Server.Os}}/{{.Server.Arch}}')   # e.g. linux/amd64 or linux/arm64
for img in nginx:1.28-alpine busybox:1.37; do
  docker pull --platform "$PLATFORM" "$img"
  docker save --platform "$PLATFORM" -o image.tar "$img"
  kind load image-archive image.tar --name lab
done
rm -f image.tar

#Start the cluster and a client Pod
#Goal: Make sure the 3-node kind cluster from Module 2 is running, and start a small client Pod we'll use to test things from inside the cluster.
cd Module3-lab/
kind get clusters
kubectl config current-context

#3. Start the client pod
echo "===== Waiting for all cluster nodes to reach 'Ready' status... ===================" 
kubectl wait --for=condition=Ready nodes --all --timeout=120s
echo "=======  Starting the client testing Pod... ======="
kubectl run client --image=busybox:1.37 -- sleep 3600
echo "======= Waiting for pod/client to enter 'Ready' state...======"
kubectl wait --for=condition=Ready pod/client --timeout=60s
echo " ======  get pod status ======="
kubectl get pod client -o wide