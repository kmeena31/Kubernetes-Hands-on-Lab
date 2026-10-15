#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-B/
echo "======Turn up verbosity to see the real request======"
kubectl get nodes -v=6 2>&1 |grep -E 'Config loaded|Response'
echo "====Call API endpoints directly======================"
kubectl get --raw /readyz
echo
kubectl get --raw '/readyz?response' |tail -3
kubectl get --raw /api/v1/namespaces/default |head -n 200 ; echo
echo "===Look at where nodes are stored in etcd (read-only)======"
kubectl -n kube-system exec etcd-lab-control-plane -- etcdctl \
    --cacert /etc/kubernetes/pki/etcd/ca.crt \
    --cert   /etc/kubernetes/pki/etcd/server.crt \
    --key    /etc/kubernetes/pki/etcd/server.key \
    get /registry/minions --prefix --keys-only