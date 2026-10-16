#!/bin/bash
set -e 
#step13: Two containers, one Pod
#Goal: Run nginx and a helper container in one Pod, and prove they share localhost and a volume.

cd Module3-lab/
echo "Run nginx and a helper container in one Pod, and prove they share localhost and a volume."
kubectl apply -f two-containers.yaml
kubectl wait --for=condition=Ready pod/two-containers --timeout=60s
kubectl get pod two-containers

kubectl exec two-containers -c writer -- wget -qO- http://localhost:80
kubectl logs two-containers -c web --tail=1

