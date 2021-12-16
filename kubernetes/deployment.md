# Deployment


It's a declarative to manage Pods using ReplicaSet

## What is ReplicaSet?

- ReplicaSet control the Pod
- Self-healing mechanism: If you delete a pod ReplicaSest creates the pod
- Ensure the request  number of Pods are available
- Provide fault-tolerance: Scale Pods horizontally with a simple command
- Can be used to scale Pods
- Relies on a Pod template: 
- No need to create Pods directly 
- Used by deploymentes

## What manage Depliyment
- Pods are managed using ReplicaSets
- Scales ReplicaSets. which scale Pods
- Support zwero-downtime updates by creating and destroying ReplicaSets
- Provices rollback functionality
- Creates a unique label that is assigned to the ReplicaSet and generated Pods
- YAML is very similar to a ReplicaSet

## Creating a deployment

 Tree structure 

- Deployment
    - ReplicaSet
        - Pod
            - Container

Yo create a deployment is necesary use YAML + kubectl (create or apply YAML file)

example

```yml
apiVeersion: apps/v1 # Kubernetes API version resource type (Deployment)
kind: Deployment
metadata:  # Metadata about the dep;oyment
 name: frontend
 labels:
  app: my-nginx
  tier: frontend
spec:
 #Replicas: 4
 selector:
  matchLabels:
   tier: frontend # The selector is used to "selext" the template to use (based on labels)
 template:
  metadata:
   labels:
    tier: frontend  # Teomplate to use to create the Pod/Containers (note that the selector mathces the label)
  spec:
   containers:
   - name: my-nginx
     image: nginx:alpine 

```

### Command

- `` kubectl get deployment --show-labels `` List all the labesls for all Deployments using the --show-labels switch.
- `` kubectl get deployment -l app=[labelname]`` Get indormation aabout aDeployment with a specific label [labelname].
- `` kubectl delete deployment [deployment-name] `` Delete a Depoyment and all associated Pods/Containers.
- `` kubectl delete deployment -f [Yaml-file-name] `` Delete a Depoyment and all associated Pods/Containers base on yaml file name.
- `` kubectl scale deployment [deployment-name] --replicas=5 `` Scale Pod horizontally.
- `` kubectl scale deployment =f [yaml-file-name] --replicas=5 `` Scale Pod horizontally based on yaml file name.