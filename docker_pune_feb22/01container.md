```
What is a container ?

- A way to package application with all the necessary dependecies and configurations
- Portable artifact, easily shared and moved around
- Makes development and deployment more effiecient

Application development before containers
- Diff installation process on each OS environment
- Many steps where something could go wrong

Developer provides Artifacts (Codebase, documentation) -> Operations team configure server needed which can lead to dependency version conflict or misunderstanding textual guide of deployment -> Which can lead to back & forth conversation until application is successfully deloyed on the server

Application development after containers
- Own isolated environment
- Packaged with all needed environment
- One command to install the app
- Run same app with 2 different versions without any conflict

With containers, Developers and operations works together to package their application in a container
No environmental configuration needed on the server - excpet docker runtime.


- Layers of images - Only different layers are downloaded
- Mostly Linux base image 
- Application image on top

Hub.docker.com -> Public repository
docker pull postgres
docker run postgres:9.6
docker ps 
docker run postgres:10.10
docker ps

Docker Image : The actual package, artifact that can be moved around
Docker container : Running instance of image, container environment is created
```