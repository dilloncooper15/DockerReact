---
description: Docker overview.
---

# Docker

## Docker

To quickly launch this project, open Terminal/ Git Bash, navigate to the project directory, and run the following command: `docker-compose -f dev.docker-compose.yml up -d` This will create an image, `frontend_image:0.1.0`, running in a container, `frontend_container`, on port `localhost:3000` and container's port `3000`.

To kill the running container and remove the image, as well as, all dangling images, run the following command from within the project directory: `docker-compose -f dev.docker-compose.yml down;docker images -a | grep "frontend_" | awk '{print $3}' | xargs docker rmi;docker image prune -f`

To build and run a production image, run the following command: `docker-compose up -d;`. **NOTE** This will build an imagine that is running on port `localhost:8080` and container's port `80`, which is the default port for `nginx`.

To kill the running container and remove the image, as well as, all dangling images, run the following command from within the project directory: `docker-compose down;docker images -a | grep "frontend_" | awk '{print $3}' | xargs docker rmi;docker image prune -f`

