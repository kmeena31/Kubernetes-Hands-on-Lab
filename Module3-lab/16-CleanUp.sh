#!/bin/bash
set -e 
#step16: Clean up
#Goal: Delete everything this module created. Keep the cluster for Module 4.

echo "Delete everything this module created. Keep the cluster for Module 4."
cd Module3-lab/
kubectl delete -f service.yaml -f pod.yaml -f two-containers.yaml -f sidecar-resize.yaml 
kubectl delete service nginx-nodeport 
kubectl delete pod client short-jobs-pod fail-once bad-image crasher userns-pod normal-pod --now
kubectl get all
