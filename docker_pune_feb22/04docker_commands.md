```
Container VS Image -
Container is a running environment for an image with its own OS, file system, networking, environment configs, application image


docker images
docker pull redis:latest <---- Pulls latest image if tag not specified
docker run redis 
docker -d redis <--- detached mode
docker stop redis
docker start redis
docker ps -a
docker start container_id

Run 2 diff redis versions
docker run redis:4.0
docker run redis

Bind container and host port
docker run -p 6000:6379 redis:4.0 
docker run -p 6001:6379 redis
docker ps

docker logs container_id/name
docker run -p 6005:6379 --name redis-latest redis:5.0

Get terminal of running container
docker exec -it redis-latest /bin/bash
```