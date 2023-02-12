# Kubernetes Cluster Monitoring
Instructions to setup Kubernetes Cluster monitoring on Minikube cluster


## Prerequisites
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://docs.docker.com/desktop/)
- [Helm3](https://helm.sh/docs/intro/install/)


## Minikube Setup :

Install Minikube

To install Minikue on Mac is easy by using brew:

`brew install minikube`


## Start a Cluster using Minikube

Once Minikube gets installed successfully, you could start a local Kubernetes cluster quickly with it.

Create a local Kubernetes cluster with the following command:

`minikube start`

<img width="1520" alt="Screenshot 2022-10-07 at 12 53 34 PM" src="https://user-images.githubusercontent.com/26805882/194496279-9f4933d8-158b-400e-b7a4-fd863bad1cff.png">


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

The first command installs the charts. Since we are using Minikube, the second command exposes theprometheus-server Service using a NodePort. 
This way we can now easily access the Prometheus web interface when the Pod is ready.


Start tunnel for `prometheus-server-np` to access prometheus on your default browser.

`minikube service prometheus-server-np`



## Grafana Setup

As with Prometheus, the stable channel official Helm charts for Grafana have been deprecated. The recommended charts are the ones hosted by the Grafana Community Kubernetes Helm Charts repository.

Same as before, we’ll start by adding the repository to our helm configuration:

`helm repo add grafana https://grafana.github.io/helm-charts`

Next, we install Grafana by using the provided charts:

```
helm install grafana grafana/grafana
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np
```


Again, since we are using Minikube, in order to easily access Grafana’s Web interface we expose the service as a NodePort.

Note: Grafana is password protected by default, in order to retrieve the admin user password we can run the following command:

`kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`


Start tunnel for `grafana-np` to access Grafana on your default browser.
We can now load the Grafana web interface using the admin user and the password retrieved:

`minikube service grafana-np`



## Configure Prometheus datasource in Grafana

Once we’re logged in to the admin interface, it’s time to configure the Prometheus Datasource.

We need to head to Configuration > Datasources and add a new Prometheus instance.

The URL for our Prometheus instance is the name of the service `http://prometheus-server:80`



## Import Kubernetes dashboard

Next, we’ll setup one of the many already available community provided Kubernetes Dashboards.

We head to `Create (+) > Import` section to `Import via grafana.com` and we set `6417` into the id field and click `Load`.

In the dashboard configuration we need to select the Prometheus Datasource we created in the earlier step.

Once we confirm the Import dialog, we’ll be redirected to the new Dashboard.



<img width="1734" alt="Screenshot 2022-10-07 at 2 49 38 PM" src="https://user-images.githubusercontent.com/26805882/194519910-968a818a-7e11-48c5-8ad6-4a8df0150ee4.png">



If everything went well, you’ll be able to see your cluster’s information in the Dashboard.

## Cleanup
Delete the cluster and other resources created for demo

```
helm delete grafana
helm delete prometheus
minikube delete
```

Kubernetes Prometheus Grafana stack Setup Guide -


