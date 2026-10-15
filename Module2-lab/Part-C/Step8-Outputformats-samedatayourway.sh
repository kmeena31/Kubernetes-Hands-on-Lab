#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-C/
echo "======== Display get nodes by wide option ==============="
kubectl get nodes -o wide
echo "========= Display get node by name =========="
kubectl get nodes -o name
echo "========= Display by using json path option ========"
kubectl get nodes -o jsonpath='{.items[*].metadata.name}'; echo

echo "=========Build your own table============="
kubectl get nodes -o custom-columns='NAME:.metadata.name,RUNTIME:.status.nodeInfo.containerRuntimeVersion,KUBELET:.status.nodeInfo.kubeletVersion,CPU:.status.capacity.cpu'

echo "=========== Full objects: YAML vs KYAML =========="
kubectl get node lab-worker -o yaml |head -8  # In Yaml
kubectl get node lab-worker -o kyaml |head -8 # In kyaml
