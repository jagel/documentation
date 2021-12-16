
## Tree structure
- Deployment => 
    - ReplicaSet => 
        - Pod => 
            - Container(s)

## Services
- Services
    - Pod
        - Container(s)


 Verify we are able to communitcate Pod`s

```powershell
# Shell into a Pd and test a UR:. Add -c [containerID]
# in cases where multiple containers are running in the Pod
kubectl exec [pod-name] --culr -s http://podIP


# Install and use curl (example shown is for Alpine Linux)
Kube exec [pod-name] -it sh
> apk add curl
> culr -s http://podIP
```