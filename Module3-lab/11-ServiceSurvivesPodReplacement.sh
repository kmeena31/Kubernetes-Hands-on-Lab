#!/bin/bash
set -e 
#step11: Service Survives Pod Replacement
#Goal: Replace the Pod, see its IP change, and prove the Service name still works.

cd Module3-lab/
echo "Replace the Pod, see its IP change, and prove the Service name still works."
kubectl get pod nginx-pod -o jsonpath='old Ip: {.status.podIP}{"\n"}'
echo "Deleting the nginx pod..."
kubectl delete pod nginx-pod
echo "Applying the updated pod definition..."
kubectl apply -f pod.yaml
echo "Waiting for the new pod to be ready..."
kubectl wait --for=condition=Ready pod/nginx-pod --timeout=60s
kubectl get pod nginx-pod -o jsonpath='new Ip: {.status.podIP}{"\n"}'
kubectl get endpointslices -l kubernetes.io/service-name=nginx-svc
kubectl exec client -- wget -qO- http://nginx-svc | grep title