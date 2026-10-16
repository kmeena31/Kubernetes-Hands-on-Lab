#!/bin/bash
set -e 
#stage: Watch the lifecycle: Pending → Running → Succeeded
#Goal: Run a Pod that does one job and exits, and watch it move through every phase.

cd Module3-lab/
echo "Run a Pod that does one job and exits, and watch it move through every phase."
kubectl run short-job --image=busybox:1.37 --restart=Never -- sh -c 'echo working; sleep 5; echo done'
kubectl get pod short-job --w --request-timeout=12s
echo "check the phase and the output"
kubectl get pod short-job -o jsonpath='{.status.phase}{"\n"}'
kubectl logs short-job

echo "compare: a container that exists with an error"
kubectl run fail-once --image=busybox:1.37 --restart=Never -- sh -c 'echo oops; exit 3'
sleep 5
kubectl get pod fail-once -o jsonpath='phase{.status.phase} exitCode={.status.containerStatuses[0].state.terminated.exitCode}{"\n"}'
