#!/bin/bash
set -e  # Exit immediately if any command fails
# Goal: Delete the demo app, the extra context, and the whole cluster.

# 1. Navigate to the working directory
cd "Module2-lab/Part-F/"
echo "========== Deleting the demo app... =========="
Kubectl delete -f demo-api.yaml
echo "========== Deleting the lab-system context... =========="
kubectl config delete-context lab-system
echo "========== Deleting the whole cluster... =========="
kubectl delete cluster --name lab 
echo "============ Verify using ps command ==========="
docker ps --filter name=lab-
echo "============ Clean up complete ==========="