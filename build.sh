#! /bin/bash

version=$(cat pom.xml | grep "</version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
docker login -u devopsmptech -p admin@987
docker build -t devopsmptech/mavenimage:1 .
docker push devopsmptech/mavenimage:1
docker run -v $(pwd):/maven devopsmptech/mavenimage:1 mvn package
pwd
ls
#cd /target
#mv *.war myapp.war
#sleep 10
#docker build -f Dockerfiletomcat -t devopsmptech/sample-application:$version .
#docker push devopsmptech/sample-application:$version
