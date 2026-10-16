#!/bin/bash
set -e

#step 10: Labels — Decide which Pods uses a Service
#Goal: Break the selector match on purpose, watch the endpoint disappear, then fix it.

cd Module3-lab/
echo "Break the selector match on purpose, watch the endpoint disappear, then fix it."
kubectl label pod nginx-pod app=web --overwrite
sleep 2
kubectl get endpointslices -l kubernetes.io/service-name=nginx-svc
kubectl  exec client -- wget -qO- http://nginx-svc 
kubectl label pod nginx-pod app=nginx --overwrite
# sleep 2
echo "After fixing the label, the endpoint should reappear:"
kubectl get endpointslices -l kubernetes.io/service-name=nginx-svc
kubectl  exec client -- wget -qO- http://nginx-svc |grep title
