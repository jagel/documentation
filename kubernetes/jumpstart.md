# Kubernetes

Kubernetes is an open source container orchestration engine for automating deployment, scaling, and management of containerized applications. The open source project is hosted by the Cloud Native Computing Foundation (CNCF)s

## Requisites

- Docker

## Instalation

- In docker UI go to settings
- Enable Kubernetes

## Commands

- ``kubectl version `` Check kubernetes version 
- ``kubectl cluster-info `` View cluster information 
- ``kubectl get all `` Retrieve information about 
- ``kubectl run [container-name] --image=[image-name] `` Simple way to create a deployment for a pod
- ``kubectl port-forward [pod] [port] `` Forward port to allow external access
- ``kubectl expose ... `` Expose a port for  a deployment/pod
- ``kubectl create [resource] `` Create a resource
- ``kubectl apply [resource] `` Create or modify a resource

### Pod commands
- `` kubectl get pods `` List only pods
- `` kubectl get all `` List all resourcess

### Yaml exercise commands
- `` kubectl create -f nginx.pod.yml `` create a pod
- `` kubectl describe pod [pod-name] `` information about the pod
- `` kubectl apply -f nginx.pod.yml `` apply changes based on yaml changes
- `` kubectl exec [pod-name] -it sh `` execute command line of a container
- `` kubectl edit -f nginx.pod.yml `` edit nginx
- `` kubectl delete -f nginx.pod.yml `` delete pod based on file

### Deployment commands

- `` kubectl get deployment --show-labels `` List all the labesls for all Deployments using the --show-labels switch.
- `` kubectl get deployment -l app=[labelname]`` Get indormation aabout aDeployment with a specific label [labelname].
- `` kubectl delete deployment [deployment-name] `` Delete a Depoyment and all associated Pods/Containers.
- `` kubectl delete deployment -f [Yaml-file-name] `` Delete a Depoyment and all associated Pods/Containers base on yaml file name.
- `` kubectl scale deployment [deployment-name] --replicas=5 `` Scale Pod horizontally.
- `` kubectl scale deployment =f [yaml-file-name] --replicas=5 `` Scale Pod horizontally based on yaml file name.

## Starting Web UI

1. Execute the following comand
> `` kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml ``

2. Get the token with the following command `` kubectl describe secret -n kube-system ``

3. Copy the Token located at the begining of the list  `` Type:  kubernetes.io/service-account-token ``

4. Go to the following url and paste the token 
`` http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/. ``

More details about Kubernetes UI Dashboard in the following [Link](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) and execute the command to deploy the dashboard UI 