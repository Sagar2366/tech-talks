1. Deploy EKS infra using Terraform -
```
terraform init
terraform plan
terraform apply
```

2. Get EKS kubeconfig locally to access the cluster
```
aws eks update-kubeconfig --region <region name> --name <cluster name>
```

3.  Install istio on EKS -
```
https://istio.io/latest/docs/setup/install/istioctl/

curl -L https://istio.io/downloadIstio | sh -
cd istio-1.19.1
export PATH=$PWD/bin:$PATH

istioctl install --set profile=default -y
kubectl label namespace default istio-injection=enabled

```

5.  Install application using Helm
```
helm upgrade onlineboutique oci://us-docker.pkg.dev/online-boutique-ci/charts/onlineboutique \
    --install
export SERVICE_IP=$(kubectl get svc --namespace default frontend-external --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
echo http://$SERVICE_IP

```
6.  Install Kiali
```
Install Kiali and the other addons and wait for them to be deployed.

$ kubectl apply -f samples/addons
$ kubectl rollout status deployment/kiali -n istio-system
```

7. Setup ArgoCD
```
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd
kubectl -n argocd get svc
Create ArgoCD Application

References - https://blog.fourninecloud.com/installing-argo-cd-using-helm-ed4a0cd0845a
```

8.  Install Prometheus & Grafana for Monitoring and alerting
9.  Add security at each layer

