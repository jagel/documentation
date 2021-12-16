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

 Services can be defined in diff