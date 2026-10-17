#!/bin/bash
set -e 

#step15: User namespaces: root in the Pod, nobody on the node
#Goal: Run the same command as root in two Pods — one with its own user namespace — and see which UID each really has on the node.

cd Module3-lab/
cat > userns-pod.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: userns-pod
spec:
  hostUsers: false          # give this Pod its own user namespace
  containers:
    - name: app
      image: busybox:1.37
      command: ["sleep", "3700"]
EOF

echo "Run the same command as root in two Pods — one with its own user namespace — and see which UID each really has on the node."
kubectl apply -f userns-pod.yaml
kubectl run normal-pod --image=busybox:1.37 -- sleep 3701
kubectl wait --for=condition=Ready pod/userns-pod pod/normal-pod --timeout=60s
kubectl exec userns-pod -- id
kubectl exec userns-pod -- cat /proc/self/uid_map
kubectl exec normal-pod -- cat /proc/self/uid_map

echo " On the node (kind nodes are containers, so we can look)"

for p in userns-pod:3700 normal-pod:3701; do
  pod=${p%:*}; secs=${p#*:}
  node=$(kubectl get pod $pod -o jsonpath='{.spec.nodeName}')
  echo "$pod on $node runs as host UID $(docker exec $node sh -c "stat -c %u /proc/\$(pgrep -f '^sleep $secs')")"
done