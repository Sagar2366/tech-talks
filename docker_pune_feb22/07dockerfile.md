```
Dockerfile is blueprint for creating docker image

.dockerignore file : This helps to avoid unnecessarily sending large or sensitive files and directories to the daemon and potentially adding them to images using ADD or COPY


# Format
INSTRUCTION arguments

FROM : The FROM instruction specifies the Parent Image from which you are building.
COPY : The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
RUN : The RUN instruction will execute any commands in a new layer on top of the current image and commit the results

CMD : The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.

ENV : The ENV instruction sets the environment variable <key> to the value <value>.
        If an environment variable is only needed during build, and not in the final image, consider setting a value for a single command instead using RUN/ARG

ARG :
SHELL : The SHELL instruction allows the default shell used for the shell form of commands to be overridden
ENTRYPOINT : An ENTRYPOINT allows you to configure a container that will run as an executable.
             You can override the ENTRYPOINT instruction using the docker run --entrypoint flag.

VOLUME : The VOLUME instruction creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers

USER : The USER instruction sets the user name (or UID) and optionally the user group (or GID) to use as the default user and group

WORKDIR : The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.

STOPSIGNAL : The STOPSIGNAL instruction sets the system call signal that will be sent to the container to exit

HEALTHCHECK : The HEALTHCHECK instruction tells Docker how to test a container to check that it is still working. This can detect cases such as a web server that is stuck in an infinite loop and unable to handle new connections, even though the server process is still running.

ONBUILD
ARG
LABEL : The LABEL instruction adds metadata to an image

EXPOSE : The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.
The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order port

ADD : The ADD instruction copies new files, directories or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>.



** Understand how CMD and ENTRYPOINT interact
Both CMD and ENTRYPOINT instructions define what command gets executed when running a container. There are few rules that describe their co-operation.

Dockerfile should specify at least one of CMD or ENTRYPOINT commands.

ENTRYPOINT should be defined when using the container as an executable.

CMD should be used as a way of defining default arguments for an ENTRYPOINT command or for executing an ad-hoc command in a container.

CMD will be overridden when running the container with alternative arguments.

The table below shows what command is executed for different ENTRYPOINT / CMD combinations:

 	                            No ENTRYPOINT	                ENTRYPOINT exec_entry p1_entry	        ENTRYPOINT [“exec_entry”, “p1_entry”]
No CMD	                        error, not allowed	            /bin/sh -c exec_entry p1_entry	        exec_entry p1_entry
CMD [“exec_cmd”, “p1_cmd”]	    exec_cmd p1_cmd	                /bin/sh -c exec_entry p1_entry	        exec_entry p1_entry exec_cmd p1_cmd
CMD exec_cmd p1_cmd	            /bin/sh -c exec_cmd p1_cmd	    /bin/sh -c exec_entry p1_entry	        exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd


```