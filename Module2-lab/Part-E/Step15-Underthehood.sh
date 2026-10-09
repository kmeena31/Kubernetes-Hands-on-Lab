#!/bin/bash
set -e  # Exit immediately if any command fails
# Goal: Look at four things every cluster has but rarely shows: how kube-proxy programs Services, which cgroup setup the kubelet uses, where the system images come from, and which control-plane component kind doesn't have.

# 1. Navigate to the working directory
cd "Module2-lab/Part-D/"

# 2. Which mode does kube-proxy use?
kubectl -n kube-system get configmap kube-proxy -o jsonpath='{.data.config\.conf}' |grep -E '^mode:'

# 3. cgroup version on your machine, cgroup driver in the kubelet
docker info --format 'cgroup version: {{.CgroupVersion}}'
kubectl get --raw /api/v1/nodes/lab-worker/proxy/configz |grep -o '"cgroupDriver":"[a-z]*"'
