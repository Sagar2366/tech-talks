### Docker Commands


## WhaleSay Hello world 

```
sudo docker run docker/whalesay cowsay  hello-world
```

## Run - Start a nginx container 
```
docker run nginx
docker run  redis:4.0              <----- Add tag
docker run -it kodekloud/simple-prompt-docker        <-------- STDIN
docker run -p 3306:3306 mysql      <-------- PORT MAPPING
docker run -v /opt/data:/var/lib/mysql mysql         <-------- VOLUME 
```

## List containers
```
docker ps
docker ps -a
```

## Stop container
```
docker stop <name> or <container-id>
```

## Remove container
```
docker rm <name>
```

## List images
```
docker images
```

## Remove Images
```
docker rmi <id>
```

## Pull image
```
docker pull nginx
```

## Append a command
```
docker run ubuntu sleep 10
```


## Exec into container 
```
docker exec <container-id> cat /etc/hosts
```

## Inspect container
```
docker inspect <container-id>
```

## Container logs
```
docker logs <container-id>
```
