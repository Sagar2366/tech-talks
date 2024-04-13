# Kubernetes - Cubernetes 



## [Roadmap](kubernetes.pdf)



## [Setup your first Kubernetes cluster with Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
   ### ![n](./assets/kind.png)
<br/>

## [Architecture](https://kubernetes.io/docs/concepts/architecture/)
   ### ![n](./assets/kubernetes-cluster-architecture.svg)
   ### Control plane components: Understand the role of each component like API server, etcd, Scheduler, and Controller manager.
   ### Node components: Learn about Kube Proxy, Kubelet, Container Runtime
   ### Addon Components: CoreDNS, Network plugins (Calico, weave, etc), Metric Server
<br/>
   

## [Organizing Cluster Access Using kubeconfig Files](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/)
   ### ![n](./assets/kubeconfig.png)
   ### Kubeconfig file is a YAML file that contains all the cluster information and credentials to connect to the cluster.
<br/>

## [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
   ### ![n](./assets/namespaces.png)
   ### Namespaces are a way to organize clusters into virtual sub-clusters — they can be helpful when different teams or projects share a Kubernetes cluster. 
<br/>

## [RBAC]()
   ### ![n](./assets/RBAC.png)
   ### RBAC is a model designed to grant access to resources based on the roles of individual users within an organization.
<br/>   

## Workload objects
   ### ![n](./assets/workloadresources.webp)
<br/>

## Service & load balancing
   ### ![n](./assets/services.webp)
   ### Since pods are ephemeral, a service enables a group of pods, which provide specific functions (web services, image processing, etc.) to be assigned a name and unique IP address (clusterIP). As long as the service is running that IP address, it will not change. Services also define policies for their access.
<br/>
   
## Configmap & secrets
   ### ![n](./assets/secret_configmap.png)
<br/>

## Volumes
   ### ![n](./assets/volumes.webp)
<br/>
   
## Scaling your app
<br/>

## Updating K8S application
<br/>

## Debugging application
<br/>

## Monitoring & Logging
   ### ![n](./assets/monitoring_logging.jpeg)
<br/>

## Kubernetes cheatsheet
   ### ![n](./assets/k8scs1.png)
   ### ![n](./assets/k8scs2.png)
   
