#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-C/
echo "===== Displaying current context ====="
kubectl config current-context
echo "====== Displaying get context ========= "
kubectl config get-contexts
echo "======= Displaying view ============="
kubectl config view --minify
echo "=========Make a second context with a different default namespace  called kube-system==========="
kubectl config set-context lab-system \
    --cluster kind-lab --user kind-lab --namespace kube-system
echo "==========Check use-context of lab-system ============"
kubectl config use-context lab-system
echo "=========== check get-context ===================="
kubectl config get-contexts
echo "=========== get pods ========================"
kubectl get pods |head -4
echo "=========== switch back======================"
kubectl config use-context kind-lab
echo "=========== check get pods =================="
kubectl get pods
echo "=========== Recognise the two classic errors==========="
kubectl get nodes --context does-not-exist
echo "============ checking server connect & port ==========="
kubectl get nodes --server https://127.0.0.1:1 --request-timeouts=5s 2>&1 |tail -1