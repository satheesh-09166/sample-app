properties([[$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator',
                                                                        numToKeepStr: '10',
                                                                        artifactNumToKeepStr: '10']]])
@Library('utils@master') _

mvnPipeline {
    config_setup = true
    post_build_script = "./scripts/post_build_script.sh"
}
