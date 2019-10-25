FROM maven:3.5.3-jdk-8

RUN mkdir /kanna && apt-get install -y git
WORKDIR /kanna
RUN git clone https://github.com/suresh-devops/sample-app.git
