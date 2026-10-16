#!/bin/bash
set -e
#Step 9: Service Discovery with DNS
#Goal: Reach nginx by the Service's name, look up its full DNS name, and prove Pods have no names of their own.

cd Module3-lab/
echo "Reach nginx by the Service's name, look up its full DNS name, and prove
    Pods have no names of their own."
kubectl exec client -- wget -qO- http://nginx-svc |grep title
kubectl exec client -- nslookup nginx-svc.default.svc.cluster.local
kubectl exec client -- cat /etc/resolv.conf

kubectl exec client -- wget -qO- -T 3 http://nginx-pod
