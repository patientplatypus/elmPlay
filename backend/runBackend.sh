docker build -t nodeapp .
#run docker image
docker run -p 3000:3000 -p 8080:8080 nodeapp
