#! /bin/bash

docker login -u devopsmptech -p admin@987
docker build -t devopsmptech/mavenimage:1 .
docker push devopsmptech/mavenimage:1
mkdir -p /var/lib/jenkins/target  || true
docker run -v $(pwd):/maven -v /var/lib/jenkins/target:/maven/target devopsmptech/mavenimage:1 mvn clean package

