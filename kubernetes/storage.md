# Storage

Volumes (altought other data storage options exist) are use to store application state/data and exhange it between Pods with Kubertees.

- Volume can be used to hold data and state for Pods and containers.

Pods live and die so theri file system is short-lived

- Volumes can be used to store state/data and use it in a Pd
- A pod can have multiple Volumes attached to it.
- Containers rely on a mountPath to access a Volume.

Kubernetes supports:
- Volumes
- PersistentVolume
- PersistentVolumeClaims
- StorageClasses (template)


## Volumes

- A volume references a storage location
- Each volume must have an uniquename.
Attached to a Pod and may or may be not tied to the Pod's lifetime (depending on the Volume type)
- A volume Mount references a volume by name and defines a mountPath

Types
- emptyDir - Empty directory for storing "transient" data (shares Pod's lifetime) useful for sharing files between containers runnign in a Pod
- hostPath - Pod mounts into the node's filesystem
- ngd - An NFS (Network File System) share mounted into the Pod
- confiMap/secret - Special types of volumes that provfuce a Pod with access to kubernetes resources
- persistentVolumeClaim - Provides Pods with amode persistent storage ption thatis abstracted from the details
- Cloud - Cluster-wide storage

Yaml example for **emptyDir** volume:

```yaml
apiVersion: v1
kind: Pod
spec:
 volumes:       # Define initial volume named "html" that it's an empty directory (lifetime of the Pod)
  - name: html
    emptyDir: {}
  containers:
  - name: nginx
    image: nginx:alpine
    volumeMounts: # Volume's reference "html" and define a mountPath
    - name: html
      mountPath: /usr/share/nginx/html
      readOnly: true
  - name: html-udater
    image: aplpine
    command: ["/bin/sh", "-c"]
    args:
     - while true; do date >> /html/index.html; sleep 10; done 
    volumeMounts: # update the file in Volume mount /html path with latest date every 10 seconds
     - name: html 
       mountPath: /html # Volume's reference "html" and define a mountPath
```

Yaml example for **hostPath** volume:

```yaml
apiVersion: v1
kind: Pod
spec:
 volumes:       # Define a socket volume on host that points to var/run/docker.sock
  - name: docker-socket
    hostPath:
     path: /var/run/docker.sock
     type: Socket
  containers:
  - name: docker
    image: docker
    command: ["sleep"]
    args: "10000"
    volumeMounts: # Volume's reference "docker-socket" and define a mountPath
    - name: docker-socket
      mountPath: /var/run/docker.sock
      readOnly: true
```
* Note: If the worker node goes down and you loose it, you will loose your volume.

Cloud volumes
- Azure (Azure disk and azure file)
- AWS - Elastic Block Store
- GCP - GCE Persist disk


## Valid type included

```yaml
# ...
hostPath
 path: /location/path
 type: Socket
#...
```
 - DirectoryOrCreate
 - Directory
 - FileOrCreate
 - File
 - Socket
 - CharDevice
 - BlockDevice


##