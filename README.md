### Definitions

- Docker Image : universal app packager; Dockerfile is the set of instructions needed to create a container/Docker image.

  ![alt text](image.png)

  - An image is the application whereas the container is an instance of that image running as a process. One can have many containers running off the same image.

- Docker Registry : universal app distribution (DokerHub), stores docker images and facilitates their distribution. Able to take the software made on one machine with all of its dependencies and run it exactly the same way on another system (with possibly a different distribution).

  ![alt text](image-1.png)

- Docker Container : Identical runtime environments, isolates applications, prevents the application running on a container from seeing the rest of the operating system (similar to a VM but in reality are restricted processes running on the OS kernel).

  ![alt text](image-2.png)

These 3 features implement the docker/container workflow "Build → Ship → Run"

### Online resources

- https://opencontainers.org/
- https://www.docker.com/101-tutorial/
- https://app.docker.com/
- https://www.bretfisher.com/kubernetes-vs-docker/
- https://www.udemy.com/course/docker-mastery

# Docker

## Docker installation

1. download Docker Desktop (tool for cintainer development) from `https://www.docker.com/products/docker-desktop/` note that "Commercial use of Docker Desktop at a company of more than 250 employees OR more than $10 million in annual revenue requires a paid subscription (Pro, Team, or Business)."

   Docker/Container requires the container image to run on a kernel that was designed for it (i.e. linux on linux and windows on windows, etc.); Thus Docker Desktop will manage the setup, upgrading, deletion, and security of a tiny VM (small linux kernel and container file system) transparantly in the background (true for macOS and Windows).

2. install ubuntu from the microsoft store, open it and create a username/password.
3. got to `Docker Desktop > Setting > Resources > WSL Integration` and enable ubuntu (this can be done with any other linux distribution).
4. open ubuntu terminal and run commands to see if successfully downlaoded all. Note that commands will be in the format `docker <managment-command> <sub-command> (options)` (old but still working format `docker <sub-command> (options)`)
   1. `docker version` verified cli can talk to engine
   2. `docker info` displays most config values of engine

### VS Code extensions

- `Docker` https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
- `Kubernetes` https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
- `Remote Development` https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
- `Live Share` https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare

## Container Basics

The command `docker container run --publish 80:80 --detach --name helloWorld nginx`

1. Looks for the specified image, `nginx`, locally in image cache, doesnt find anything.
2. Looks in remote image repository (defaults to Docker Hub)
3. Downloads the latest version (`nginx:latest` by default)
4. Creates a new container based on that image inside docker engine (with name `helloWorld`). Note that names have to be unique
5. Gives it a virtual IP on a private netwrok inside docker engine
6. Opens up port `80:` on host and forwards to port `:80` in container
7. Starts conainer by using the CMD in the image Dockerfile

run a `nginx`, `mysql`, and `httpd` (apache) server all in `--detach` and name them appropriately. nginx should listne on `80:80`, mysql on `3306:3306`, and httpd on `8080:80`. When running mysql, pass in `MYSQL_RANDOM_ROOT_PASSWORD=yes`, and use the `docker container logs` on mysql to find the random password it created on startup. Clean it all up with `docker container stop` and `docker container rm` (both can accept multiple names or IDs). Use `docker container ls` to ensure everything is correct before and after cleanup.

1. `docker container ls`
2. `docker container run -p 80:80 --name nginx -d nginx`
3. `docker container run -p 8080:80 --name httpd -d httpd`
4. `docker container run -p 3306:3306 --name mysql --env MYSQL_RANDOM_ROOT_PASSWORD=yes -d mysql`
5. `docker container logs mysql | grep "PASSWORD"`
6. `docker container ls`
7. `docker container stop nginx httpd mysql`
8. `docker container rm nginx httpd mysql`

## Image Basics

## Docker Networking

## Docker Volumes

## Docker Compose

# Orchestration

## Docker Swarm

## Kubernetes
