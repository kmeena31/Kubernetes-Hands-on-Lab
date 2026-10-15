#!/bin/bash
set -e 

echo "=============== checking cluster nodes ==================="
kubectl run nginx-pod --image=nginx:1.28-alpine 
echo "waiting for pod/nginx-pod to enter 'Ready' state..."
kubectl wait --for=condition=Ready pod/nginx-pod --timeout=60s
echo "=======  get pod status ======="
kubectl get pods
echo "=======  get pod status in wide format ======="
kubectl get pod nginx-pod  -o wide

#Deep inspection — scan the key fields, then the events
echo "=======  get pod status in yaml format ======="
kubectl describe pod nginx-pod |grep -E '^Name|Namespace|Node|Status|IP):|Image:|Restart Count'
echo " =======  get pod events ======="
kubectl describe pod nginx-pod |sed -n '/^Events:/,$p' 
#Read the logs, then delete the Pod
echo "=======  get pod logs ======="
kubectl logs nginx-pod |tail -3
echo "=======  delete pod ======="
kubectl delete pod nginx-pod
echo "=======  show get pod status ======="
kubectl get pods 