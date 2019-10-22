FROM maven:3-jdk-8
ARG jenkins_group_id
ARG jenkins_user_id
RUN groupadd -g ${jenkins_group_id} jenkins && \
    useradd -r -u ${jenkins_user_id} -g jenkins jenkins
RUN mkdir /home/jenkins
RUN chown jenkins:jenkins  /home/jenkins
WORKDIR /home/jenkins
USER jenkins:jenkins

