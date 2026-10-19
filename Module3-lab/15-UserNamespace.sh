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

# if ! kubectl wait --for=condition=Ready pod/userns-pod pod/normal-pod --timeout=300s
#     echo "⚠️  Pods failed to become ready in time. Let's see why:"
#     echo "--- userns-pod Events ---"
#     kubectl describe pod userns-pod | grep -A 10 Events || true
#     echo "--------------------------"
#     exit 1 || true
# fi 

echo "🚀 Both pods are running! Inspecting UIDs inside the containers:"
echo "--- userns-pod ---"
kubectl exec userns-pod -c app -- id
kubectl exec userns-pod -c app -- cat /proc/self/uid_map

echo "--- normal-pod ---"
kubectl exec normal-pod -- id
kubectl exec normal-pod -- cat /proc/self/uid_map

echo " On the node (kind nodes are containers, so we can look)"
  # Cleaned up the nested escaping to ensure pgrep succeeds reliably on the host
  pid=$(docker exec "$node" pgrep -f "^sleep $secs" || true)
  if [ -n "$pid" ]; then
      host_uid=$(docker exec "$node" stat -c %u "/proc/$pid")
      echo "$pod on $node runs as host UID $host_uid"
  else
      echo "❌ Could not find host PID for $pod (sleep $secs)"
  fi
done

# for p in userns-pod:3700 normal-pod:3701; do
#   pod=${p%:*}; secs=${p#*:}
#   node=$(kubectl get pod $pod -o jsonpath='{.spec.nodeName}')
#   echo "$pod on $node runs as host UID $(docker exec $node sh -c "stat -c %u /proc/\$(pgrep -f '^sleep $secs')")"
# done