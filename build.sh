#! /bin/bash

version=$(cat pom.xml | grep "</version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
docker login -u devopsmptech -p admin@987
docker build -t docker.io/devopsmptech/mavenimage:1 .
docker push docker.io/devopsmptech/mavenimage:1
docker run -v $(pwd):/maven devopsmptech/mavenimage:1 mvn clean package
pwd
sleep 10
docker build -f Dockerfiletomcat -t docker.io/devopsmptech/sample-application:$version .
docker login -u devopsmptech -p admin@987
docker push docker.io/devopsmptech/sample-application:$version
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
