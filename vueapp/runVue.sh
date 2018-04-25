#!/bin/bash

# # stop all containers
# docker stop $(docker ps -aq)
# # remove all containers
# docker rm $(docker ps -aq)
# # remove all images
# docker rmi $(docker images -q)

docker build -t vueapp .
#run docker image
docker run -p 5000:5000 vueapp
