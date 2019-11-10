#! /bin/bash


version=$(cat pom.xml | grep "</version>" | head -1 | awk '{print $1}' | sed "s/<version>//" | sed "s/<.*//")
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker rmi -f $(docker images -aq)
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker rm -f tomcat1
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker rm -f tomcat2
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker login docker.io -u devopsmptech -p admin@987
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker run -d --name tomcat1 -p 8080:8080 devopsmptech/sample-application:$version
ssh -o StrictHostKeyChecking=no ec2-user@172.31.95.243 docker run -d --name tomcat2 -p 8081:8080 devopsmptech/sample-application:$version
