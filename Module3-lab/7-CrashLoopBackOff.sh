#!/bin/bash
set -e

#step-7: CrashLoopBackOff — read the real error
#Goal: Run an app that crashes on start-up, and use logs and describe to find the root cause.

cd Module3-lab/
echo "Run an app that crashes on start-up, and use logs and describe to find the root cause."
kubectl run crasher --image=busybox:1.37 -- \
   sh -c 'echo "Starting app..."; echo "Error: Database_URL is not set"; exit 1'
sleep 5
kubectl get pod crasher
kubectl logs crasher
kubectl describe pod crasher | grep -E 'Last State|Exit Code|Restart Counter|BackOff'
