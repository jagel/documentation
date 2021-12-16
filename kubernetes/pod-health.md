# Pod Health

Kubernetes relies on **Probes** to detemine the health of a Pod container

A probe is a diagnostic performed periodically by the kubelet on a container

Types of probes

- Lyveness probes: Determine if a Pod is healthy and running as expected
- Rediness ptobes: Helst kubernetes to determine if a Pod should reveive requests
Failed Pod conainers are recreated by default (restartPolicy dafaults to Always).

Example yaml file Defining an HTTP Liveness Probe 

```yml
apiVersion: v1
kind: Pod
#...
spec:
 containers:
 - name: my-nginx
   image: nginx:alpine

   livenessProbe:       # Define liveness probe
    httpGet:
     path: /index.html  # Check /index.html on port 80
     port: 50
    initialDelaySeconds: 15 # Wait 15 seconds
    timeoutSeconds: 2       # Timeout after 2 seconds
    periodSeconds: 6        # Check every 5 seconds
    faulureThreshiold: 1    # Allow 1 failure before failing Pod
```
