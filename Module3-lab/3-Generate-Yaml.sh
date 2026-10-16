#!/bin/bash
set -e 

# Generate yaml, then apply it
#Goal:Let kubectl write a draft manifest, compare it with the clean pod.yaml, and create the Pod declaratively.

#1. Draft a manifest — nothing is created
cd Module3-lab/
kubectl run nginx-pod --image=nginx:1.28-alpine --port=80 -l app=nginx \
--dry-run=client -o yaml 

#2. Compare the draft manifest with the clean pod.yaml
echo "Comparing the draft manifest with the clean pod.yaml"
kubectl apply -f pod.yaml
kubectl wait --for=condition=Ready pod/nginx-pod --timeout=60s
kubectl get pod nginx-pod --show-labels