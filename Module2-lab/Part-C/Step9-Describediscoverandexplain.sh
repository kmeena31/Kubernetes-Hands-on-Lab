#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-C/
kubectl describe node lab-worker | grep -E '^(Name|Roles|Taints):|Ready|InternalIP|Container Runtime|Non-terminated'
kubectl describe node lab-control-plane | grep Taints
echo "=========== Every resource type the cluster knows ========="
kubectl api-resources | head -1
kubectl api-resources | grep -wE 'pods|nodes|namespaces|services|deployments'
kubectl api-resources | wc -l
echo "========= Read the docs for any field ==================="
kubectl explain pod.
