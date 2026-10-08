#!/bin/bash
set -e  # Exit immediately if any command fails
#Goal: Declare "I want 3 nginx pods", then read the events to see each component do its job.
cd Module2-lab/Part-D/
echo "======Deploying 3 nginx pods======"
kubectl create deployment web --image=nginx:1.28-alpine --replicas=3
kubectl rollout status deployment/web
kubectl get pods -o wide
echo "======Reading events to see each component do its job======"
kubectl get events --sort-by=.metadata.resourceVersion\
    -o CUSTOM-columns='.WHO:.source.component,WHAT:.reason,OBJECT:.involvedObject.name'| grep -E '^WHO|web'