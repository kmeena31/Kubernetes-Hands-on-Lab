#!/bin/bash
set -e

#Step-6: ImagePullBackOff — a bad image tag
#Goal: Create a Pod with an image tag that doesn't exist, and find the reason in the events.

cd Module3-lab/
echo "Create a Pod with an image tag that doesn't exist, and find the reason in the events."
kubectl run bad-image --image=nginx:9.99-doesnotexist
sleep 20
kubectl get pod bad-image
kubectl describe pod bad-image | grep -E 'Warning' | head -3

