#! /bin/bash

version=$(cat pom.xml | grep "</version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
docker login -u devopsmptech -p admin@987
docker build -t devopsmptech/mavenimage:1 .
docker push devopsmptech/mavenimage:1
mkdir -p /var/lib/jenkins/target  || true
docker run -v $(pwd):/maven -v /var/lib/jenkins/target:/maven/target devopsmptech/mavenimage:1 mvn package
cp /var/lib/jenkins/target/*.war /var/lib/jenkins/builds/
mv /var/lib/jenkins/builds/*.war /var/lib/jenkins/builds/myapp.war
docker build -f Dockerfiletomcat -t devopsmptech/sample-application:$version .
docker push devopsmptech/sample-application:$version
