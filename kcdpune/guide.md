# Deploy an app
```
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
kubectl get deployments

export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME:8080/proxy/
```
<br/>


# Explore app
```
kubectl get - list resources
kubectl describe - show detailed information about a resource
kubectl logs - print the logs from a container in a pod
kubectl exec - execute a command on a container in a pod
```
<br/>

# Expose app publicly
```
kubectl get services
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
kubectl describe services/kubernetes-bootcamp

export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')"
echo "NODE_PORT=$NODE_PORT"

minikube service kubernetes-bootcamp --url  <Separate terminal>
curl 127.0.0.1:51082

kubectl delete service -l app=kubernetes-bootcamp
```
<br/>


# Scaling your app
```
kubectl get deployments
kubectl scale deployments/kubernetes-bootcamp --replicas=4
kubectl describe deployments/kubernetes-bootcamp
kubectl scale deployments/kubernetes-bootcamp --replicas=2
```
<br/>

# Update your app
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=docker.io/jocatalin/kubernetes-bootcamp:v2
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10
kubectl get deployments
kubectl rollout undo deployments/kubernetes-bootcamp
kubectl delete deployments/kubernetes-bootcamp services/kubernetes-bootcamp
```
