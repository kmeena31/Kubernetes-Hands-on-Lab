#!/bin/bash
set -e  # Exit immediately if any command fails

cd Module2-lab/Part-A/
kind create cluster --config kind-cluster.yaml
echo "=============== checking cluster nodes ==================="
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'