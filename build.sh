#! /bin/bash

version=$(cat pom.xml | grep "</version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
docker login docker.io -u devopsmptech -p admin@987
docker build -t mavenimage:1 .
docker tag mavenimage:1 devopsmptech/mavenimage:1
docker push devopsmptech/mavenimage:1
docker run -v $(pwd):/maven devopsmptech/mavenimage:1 mvn clean package
pwd
sleep 10
docker build -f Dockerfiletomcat -t sample-application:9 .
docker tag sample-application:9 devopsmptech/sample-application:9
docker login docker.io -u devopsmptech -p admin@987
docker push devopsmptech/sample-application:9
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
