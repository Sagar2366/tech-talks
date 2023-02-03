```
AWS ECR as Docker registry 

docker login
docker build -t my-app .
docker tag my-app private-registry/app/my-app:latest
docker push private-registry/app/my-app:latest
docker pull my-app
docker images

```