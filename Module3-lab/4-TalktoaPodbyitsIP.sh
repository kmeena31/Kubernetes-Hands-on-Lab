#!/bin/bash
set -e 
#name: Talk to a Pod by its IP
#Goal: Reach nginx from another Pod using its Pod IP, and see why that IP isn't something to rely on.

cd Module3-lab/
echo "Get the Pod IP of nginx-pod"
POD_IP=$(kubectl get pod nginx-pod -o jsonpath='{.status.podIP}')
echo "Pod IP: $POD_IP"
echo "Create a Pod to talk to nginx-pod by its IP"
kubectl exec client -- wget -qo- http://$POD_IP |grep title             