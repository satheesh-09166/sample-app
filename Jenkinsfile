pipeline {
  agent any
    environment {
        DEFAULT_REGION = "us-west-2"
        MAVEN_HOME= tool name: 'maven-3.6.2', type: 'maven'
        MAVEN_BIN = "${MAVEN_HOME}/bin"
        ACCOUNT_ROLE = "arn:aws:iam::669632791795:role/SureshRole"
        MAVEN_CONTAINER = "maven:3-jdk-8"
    }

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()
        parallelsAlwaysFailFast()
    }

        stages {
          stage("Build Step") {
            parallel {
              stage('Maven Build Step w/Docker') {
                when {
                  beforeAgent true
                }
                agent {
                  docker {
                    reuseNode true
                    image "${Constants.MAVEN_CONTAINER}"
                    alwaysPull true
                    args '--network=host --dns=127.0.0.1 -v /var/lib/jenkins/.aws:/root/.aws -v /var/lib/jenkins/.m2:/root/.m2'
                  }
                }
                steps {
                  sh "mvn clean package"
                }
              }
            }
          }


}
}




// properties([[$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator',
//                                                                         numToKeepStr: '10',
//                                                                         artifactNumToKeepStr: '10']]])
// @Library('utils@master') _
//
// mvnPipeline {
//     config_setup = true
//     maven_script = "mvn clean package"
//     post_build_script = "./scripts/post_build_script.sh"
// }
