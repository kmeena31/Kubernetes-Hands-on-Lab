#!/bin/bash
set -e  # Exit immediately if any command fails
#Goal: Break the desired state and watch the controller manager fix it within seconds.
cd Module2-lab/Part-D/
echo "======Deleting a pod to trigger self-healing======"
POD=$(kubectl get pods -l app=web -o jsonpath='{.items[0].metadata.name}')
echo "Deleting $POD"
kubectl delete pod "$POD"
kubectl wait --for=condition=Ready pod -l app=web --timeout=60s
kubectl get pods -l app=web -o wide
echo "======Self-healing complete======"
