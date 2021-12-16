# YAML Fundamental

- Oiriginally named YAML because it stands for: Yet Another Markup Language, but nowadays it's called YAML ain't markup language
- Text file compose of maps and lists
- Identation matter to be consistent
- Always use spaces

## Maps: 

 - name: value pairs
 - Maps can contain other map for more complex data structure

 ## Lists:
 - Sequence of items
 - Multiple maps can be defined in a list

Example
 ```yaml
 key: value
 complexMap:
  key1: value
  key2:
   subKey: value
items:
 - item1
 - item2
itesMap:
 - map1: value
  map1Prop: value
 - map1: value
  map1Prop: value
 ```

 ## Designing a Pod with YAML

Creating a Podd using YAML

yaml document
 ```yaml

 apiVersion: v1          # Kubernetes API version
 kind: Pod               # Type of Kubernetes resource
 metadata:               # Metadata about the pod
  name: my-nginx         # Name of the pof
spec:                    # Specification (what is going to go in this pod) blueprint
 containers:
 - name: my-nginx
   image: mginx:alpine
```

Execute the following command

```powershell
kubectl create -f file.pod.yml --dry-run --validate=true

#--dry-run : perfom a execution trial to validate if the configuration is succesfull.
# --validate=true : it validates if YAMPL has errors.
```

Altenate yat to create or apply changes to a Pod from YAML

```powershell
kubectl apply -f file.pod.yml
```


## Deleting a Pod

To delte a Pod use kubectl delete 

```powershell
#Delete pod
kubectl delete pod [name-of-pod]

#Delete Pod using YAML file that created it
kubectl delete -f file.pod.yml
```