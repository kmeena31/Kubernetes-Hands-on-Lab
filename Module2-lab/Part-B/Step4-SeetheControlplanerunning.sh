#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-B/
kubectl get pods -n kube-system -o wide --sort-by=.spec.nodeName