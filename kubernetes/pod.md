# Pod core concepts

A pod is the basic execution unit of a Kubernetes apllication-the smallest and simplest unit in the Kubenetes object model that youd create or deploy

A pod is an environment for conainer (Server. Caching, APIs, database, etc)

A pod has an IP address, memory, volume, and I could be share across multiple containers within the Pod if needed.

Scale horizontally by adding Pod (Replicas) with a node

Pods live and die but never come back to life

has pod health

## The role of Pod

Pod has replicas and are clones

If a Pod is sick K18s cand remove it and create a replica (not the same Pod).
If a pod has more than one replica, each one will have a unique port.

It's common to have a container per pod but is not exclusive to work on that way

Every Pods belongs to a single node.

## Create a Pod

There are several different ways to cshedule a Pod:

- `` kubectl run `` quick and easy way to create a pod (imperative way)
- `` kubectl create/apply `` yaml file required

example 

> `` kubectl run [podname] --image=nginx:alpline ``

- `` kubectl get pods `` List only pods
- `` kubectl get all `` List all resources


##  Expose a Pod Port

Pods and containers are only accessible within the Kubernetes cluster by default.

One way to expose a container port extremally: kubectl port-forward.
 

```powershell
# Enable pof container to be called externally
kubectl port-forward [name-of-pod] 8080:80
#8080 => External port
#80 => Internal port
```

## Deleting a pod

Running a Pod will cause a Depliyment to be created.
To delete a Pod us find the deployment and use the following command

```powershell
#Will cause pod to be recreated
 kubectl delete pod [name-of-pod]
 ```

The best way to identify the pod was deleted is with verifying the pod id changed after execute the command

> To delete officially a Pod and not have to come back: You'd have to delete the deployment that originally schecduled the Pod

