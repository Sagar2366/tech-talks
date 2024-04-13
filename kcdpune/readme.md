# Kubernetes - Cubernetes 



## [Roadmap](kubernetes.pdf)



## [Setup your first Kubernetes cluster with Kind](https://minikube.sigs.k8s.io/docs/start/)
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

## Workload objects
   ### ![n](./assets/workloadresources.webp)
<br/>

## Service & load balancing
   ### ![n](./assets/services.webp)
   ### Since pods are ephemeral, a service enables a group of pods, which provide specific functions (web services, image processing, etc.) to be assigned a name and unique IP address (clusterIP). As long as the service is running that IP address, it will not change. Services also define policies for their access.

   ### ClusterIP (default) - Exposes the Service on an internal IP in the cluster. This type makes the Service only reachable from within the cluster.
   ### NodePort - Exposes the Service on the same port of each selected Node in the cluster using NAT. Makes a Service accessible from outside the cluster using <NodeIP>:<NodePort>. Superset of ClusterIP.
   ### LoadBalancer - Creates an external load balancer in the current cloud (if supported) and assigns a fixed, external IP to the Service. Superset of NodePort.
   ### ExternalName - Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up. This type requires v1.7 or higher of kube-dns, or CoreDNS version 0.0.8 or higher.
<br/>
   
   
## Scaling your app
<br/>

## Updating K8S application
<br/>

## Debugging application
<br/>

## Kubernetes cheatsheet
   ### ![n](./assets/k8scs1.png)
   ### ![n](./assets/k8scs2.png)
