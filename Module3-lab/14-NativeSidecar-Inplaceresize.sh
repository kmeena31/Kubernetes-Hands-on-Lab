#!/bin/bash
set -e 

#step14: Native Sidecar with In-place Resize
#Goal: Run a native sidecar that ships nginx's logs, then change the Pod's CPU without restarting it.


cd Module3-lab/
echo "Run a native sidecar that ships nginx's logs, then change the Pod's CPU without restarting it."
kubectl apply -f sidecar-resize.yaml
kubectl wait --for=condition=Ready pod/modern-pod  --timeout=60s
kubectl get pod modern-pod
kubectl exec modern-pod -c web -- wget -qO- http://localhost > /dev/null
sleep 2
kubectl logs modern-pod -c log-shipper --tail=1

echo "Resizing the Pod's CPU in place without restarting it..."
kubectl get pod modern-pod -o jsonpath='before: cpu limit={.spec.containers[0].resources.limits.cpu} restarts={.status.containerStatuses[0].restartCount}{"\n"}'
kubectl patch pod modern-pod --subresource resize \
  --patch '{"spec":{"containers":[{"name":"web","resources":{"requests":{"cpu":"200m"},"limits":{"cpu":"400m"}}}]}}'
sleep 3
kubectl get pod modern-pod -o jsonpath='after:  cpu limit={.status.containerStatuses[0].resources.limits.cpu} restarts={.status.containerStatuses[0].restartCount}{"\n"}'