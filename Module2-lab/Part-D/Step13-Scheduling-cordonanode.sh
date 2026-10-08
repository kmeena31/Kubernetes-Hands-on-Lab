#!/bin/bash
set -e  # Exit immediately if any command fails
#Goal: Mark a node as unschedulable and watch the scheduler route new pods around it.
cd Module2-lab/Part-D/
echo "======Marking a node as unschedulable======"
kubectl cordon lab-worker2
echo "======Node cordoned======"
kubectl get nodes
echo "======Scaling the deployment to 6 replicas======"
kubectl scale deployment web --replicas=6
echo "======Waiting for the rollout to complete======"
kubectl rollout status deployment/web
echo "======Checking the distribution of pods across nodes======"
kubectl get pods -l app=web -o wide --sort-by=.spec.nodeName
echo "======Cordon complete======"

echo "=========Undo, and remove the demo app ==========="
kubectl uncordon lab-worker2
kubectl delete deployment web
echo "=========Demo app removed and node uncordoned=========="