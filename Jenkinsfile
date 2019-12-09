pipeline {
  agent none
  environment {
    CI = 'true'
  }
  stages {
    stage('Test') {
      failFast true
      parallel {
        stage('Test::Node') {
          agent { docker 'node:lts' }
          stages {
            stage('Test::Node::Prepare') {
              steps {
                sh 'yarn'
              }
            }
            stage('Test::Node::Build') {
              steps {
                sh 'yarn build'
                archiveArtifacts 'public/'
              }
            }
          }
        }
        stage('Test::Docker') {
          agent { docker 'docker:dind' }
          steps {
            sh 'docker build .'
          }
        }
      }
    }
  }
}
