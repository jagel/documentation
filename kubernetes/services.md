# Services

Provides a single point of entry for accessing one or more Pods.

What happend if a pod died? Can you rely on their IP?
A: No! That's why we need Services - IPs change a lot!

- Services abstract Pod IP Address from consumers 
-  Labels are important in services, to hoog up the Pods with a service
- Load balances between Pod
- Relies on labels associate a Service with a Pod
- Node's kube-proxy creates a virtual IP for services
- Layer 4 (TCP/UDP over IP)
- Creates endpoint witch sit between a Service and Pod
- Are not ephimeral wich means it won't change IPs 
 
 ## Services types

 Services can be defined in differents ways
  
- ClusterIp: Expose the service on a cluster-internal IP (default)
- NodePort: Expose the service on each Node's IP at a static port.
- LoadBalancer: Provision an external IP to axt as a load balancer for the service
- ExternalName: Maps a service to a DNS name

### ClusterIp Service

- Service IP is exposed internally within the cluster.
- Only Pods within the cluster can talk to the Service, Allows Pods to talk to other Pods.
- Outside the service is not possible to connect with another Pods

### NodePort Srvice

- Exposes the Service on esch Node's IP at s static port
- Allocates a port from a range (default is  30,000-32767)
- Each Node proxies the allocated port.

### LoadBalancer Service

- Exposes a Service externally
- Useful when combine with a cloud provider's laod balancer.
- NodePort and ClusterIP Services are created.
- Each Node procies the allocated port.

### ExternalName Service

- Service that acts as an alias for an external service
- Allows a Service to act as the proxy for an external service
- External service details are hiddden from a cluster (easier to change)

## Example

How can you access a Pod from outside of Kubernetes?
A. Port forwarding

```powershell
# Listen on port 8080 locally and forward to port 80 in Pod
kubectl port-forward pod/[pod-name] 8080:80

# Listen on port 8080 locally and forward to Depliyment's Pod
kubectl port-forward pod/[deployment-name] 8080

# Listen on port 8080 locally and forward to Service's Pod
kubectl port-forward pod/[service-name] 8080

```

Defining a service in YAML 

```yaml
# ClusterIp service
apiVersion: V1 # Kubernetes api version and resource type (Service)
kind: Service
metadata:
 name: nginx # Metadata about the Service
 labels:
  app: nginx
spec:
 selector:
  app: nginx # Service will apply to resources with a label of app:ngonc
 ports:
 - name: http
   port: 80 # Define container target port(s) and the port(s) for the Service.
   targetPort: 80
```

Note: The name in metadata seccion gets a DNS entry wich it meanch that could access to the container using the metadata name and port  `` http://nginx:80/ `` in this case you don't have to worry about the IP.

NodePort Service

```yaml
# NodePort Service
apiVersion: V1 # Kubernetes api version and resource type (Service)
kind: Service
metadata:
 name: nginx # Metadata about the Service
 labels:
  app: nginx
spec:
 type: NodePort # SET THE SERVICE TYPE TO NodePort
selector:
  app: nginx # Service will apply to resources with a label of app:ngonc
 ports:
 - port: 80 # Define container target port(s) and the port(s) for the Service.
   targetPort: 80
   nodePort: 31000 # (Optional) set NodePort valude defaults between 30,000-32,767
```

Load balancer service (Normally used with cloud providers)
```yaml
# LoadBalancer Service
apiVersion: V1 # Kubernetes api version and resource type (Service)
kind: Service
metadata:
 name: nginx # Metadata about the Service
 labels:
  app: nginx
spec:
  type: LoadBalancer # SET THE SERVICE TYPE TO LoadBalancer
 selector:
  app: nginx # Service will apply to resources with a label of app:ngonc
 ports:
 - port: 80 # External port (localhost:80)
   targetPort: 80 # What it will call into.
```

Exxternal Name service

```yaml
# LoadBalancer Service
apiVersion: V1 # Kubernetes api version and resource type (Service)
kind: Service
metadata:
 name: external-service # Metadata about the Service
 labels:
  app: nginx
spec:
  type: ExternalName # SET THE SERVICE TYPE TO ExternalName
  externalName: api.example.com #
 selector:
  app: nginx 
 ports:
 - port: 9000 
```