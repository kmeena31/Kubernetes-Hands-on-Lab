#!/bin/bash
set -e 
#step12: NodePort and Port Forwarding
#Goal: Expose nginx on a port on every node, then reach it from your laptop.

cd Module3-lab/
echo "Expose nginx on a port on every node, then reach it from your laptop."
kubectl expose pod nginx-pod --type=NodePort --port=80 --name=nginx-nodeport
kubectl get service nginx-nodeport
NODE_PORT=$(kubectl get service nginx-nodeport -o=jsonpath='{.spec.ports[0].nodePort}')
echo "NodePort: $NODE_PORT"
sleep 3   # give kube-proxy a moment to program every node

for node in lab-control-plane lab-worker lab-worker2; do
  docker exec lab-control-plane curl -s -o /dev/null -w "$node:$NODE_PORT -> %{http_code}\n" http://$node:$NODE_PORT
done

echo "From your laptop: port-forward"
kubectl port-forward service/nginx-svc  8080:80 > /dev/null &
PF_PID=$!
sleep 3
curl -s  "http://localhost:8080 | grep title
kill $PF_PID

