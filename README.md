# kubernetes-monitoring
Instructions to setup Kubernetes Cluster monitoring on Minikube cluster


## Prerequisites
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://docs.docker.com/desktop/)
- [Helm](https://helm.sh/docs/intro/install/)


## Minikube Setup :

Install Minikube

To install Minikue on Mac is easy by using brew:

`brew install minikube`


## Start a Cluster using Minikube

Once Minikube gets installed successfully, you could start a local Kubernetes cluster quickly with it.

I created a local cluster with two nodes with the following command:

`minikube start -n 2`

<img width="1520" alt="Screenshot 2022-10-07 at 12 13 50 PM" src="https://user-images.githubusercontent.com/26805882/194484450-0141d304-1f78-44cf-8810-0eacd8ee3d71.png">

Then, run a kubectl command to verify it looks good:

<img width="1520" alt="Screenshot 2022-10-07 at 12 15 12 PM" src="https://user-images.githubusercontent.com/26805882/194484666-48061e4c-86ed-43e7-887c-26e156859750.png">


## Prometheus Setup

We’ll start by adding the repository to our helm configuration:

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

Once the repo is ready, we can install the provided charts by running the following commands:

```
helm install prometheus prometheus-community/prometheus
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np
```
