#!/bin/bash
set -e  # Exit immediately if any command fails

 cd Module2-lab/Part-A/
 kubectl wait --for=condition=Ready nodes --all --timeout=120s
 echo "=======Kubectl version info==========="
 kubectl version 
 echo "============cluster info=============="
 kubectl cluster-info
 echo "============= get nodes =============="
 kubectl get nodes
 echo "============ get namespaces =========="
 kubectl get namespaces