#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-B/
echo "=== systemctl is active =================="
docker exec lab-worker systemctl is-active kubelet containerd
echo "============message says docker is not instaled if not =================="
docker exec lab-worker sh -c 'command -v docker || echo "docker: not installed"'
echo "===  docker lab-worker ps status =================="
docker exec lab-worker crictl ps
echo "=== kubectl get nodes =================="
kubectl get nodes -o wide

echo "=== Running process check inside node =================="
docker exec lab-worker sh -c "ps -e -o comm | grep -E 'kubelet|containerd' | sort -u"

