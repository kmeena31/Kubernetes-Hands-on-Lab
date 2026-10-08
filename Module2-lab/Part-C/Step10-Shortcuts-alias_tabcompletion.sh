#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-C/
alias k=kubectl
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
echo "======Using alias 'k' for kubectl======="
k get no