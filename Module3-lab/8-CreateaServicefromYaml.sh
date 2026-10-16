#!/bin/bash
set -e

#Step 8: Create a Service from YAML
#Goal: Put a stable name and IP in front of nginx-pod with a ClusterIP service.
cd Module3-lab/
echo "Create a Service from YAML"
kubectl apply -f nginx-service.yaml
kubectl get service nginx-svc
kubectl describe service nginx-svc |grep -E 'Selector|Type:|^IP:|Port|Endpoints'
kubectl get endpointslices -l kubernetes.io/service-name=nginx-svc