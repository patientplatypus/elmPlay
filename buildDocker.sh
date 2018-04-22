
#!/bin/bash

# stop all containers
docker stop $(docker ps -aq)
# remove all containers
docker rm $(docker ps -aq)
# remove all images
docker rmi $(docker images -q)

#build docker image
docker build -t elmapp .
#run docker image
docker run -p 8080:8000 elmapp
