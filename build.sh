#! /bin/bash

docker login -u devopsmptech -p admin@987
docker build -t devopsmptech/mavenimage:1 .
docker push devopsmptech/mavenimage:1
rm-rf /var/lib/jenkins/target/* || true
mkdir -p /var/lib/jenkins/target  || true
docker run -v $(pwd):/maven -v /var/lib/jenkins/target:/maven/target devopsmptech/mavenimage:1 mvn package
mkdir -p /var/lib/jenkins/builds || true
cp /var/lib/jenkins/target/*.war /var/lib/jenkins/builds/
