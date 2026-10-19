#!/bin/bash
set -e
#step15: User namespaces -  root in the Pod, nobody on the node
#Goal: Run a Pod as root, but have it appear as nobody on the node.

cd Module3-lab/

kubectl delete pod userns-pod normal-pod --ignore-not-found=true

kubectl apply -f userns-pod.yaml
kubectl run normal-pod --image=busybox:1.37 -- sleep 3701

echo "⏳ Waiting for pods to become ready..."
# Use a try/catch structure so a timeout doesn't instantly crash the pipeline
if !kubectl wait --for=condition=Ready pod/userns-pod pod/normal-pod --timeout=60s; then
  echo "⚠️ Pods timed out. Printing diagnostic info below:"
    
    echo "=== USERS-POD STATUS ==="
    kubectl get pod userns-pod
    kubectl describe pod userns-pod | tail -n 20
    
    echo "=== NORMAL-POD STATUS ==="
    kubectl get pod normal-pod
    kubectl describe pod normal-pod | tail -n 20

    exit 1
fi


echo "🚀 Pods are ready! Running inspections:"
kubectl exec userns-pod -c app -- id
kubectl exec userns-pod -c app -- cat /proc/self/uid_map
kubectl exec normal-pod -- cat /proc/self/uid_map