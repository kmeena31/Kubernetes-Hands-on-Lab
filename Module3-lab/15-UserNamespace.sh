#!/bin/bash
set -e
#step15: User namespaces -  root in the Pod, nobody on the node
#Goal: Run a Pod as root, but have it appear as nobody on the node.

cd Module3-lab/
kubectl apply -f userns-pod.yaml
kubectl run normal-pod --image=busybox:1.37 -- sleep 3701
kubectl wait --for=condition=Ready pod/userns-pod pod/normal-pod --timeout=60s
kubectl exec userns-pod -- id
kubectl exec userns-pod -- cat /proc/self/uid_map
kubectl exec normal-pod -- cat /proc/self/uid_map