pipeline {
  agent none
  environment {
    CI = 'true'
  }
  stages {
    stage('Test') {
      failFast true
      parallel {
        stage('Node') {
          agent { docker 'node:lts' }
          stages {
            stage('Prepare') {
              steps {
                sh 'yarn'
              }
            }
            stage('Build') {
              steps {
                sh 'yarn build'
                archiveArtifacts 'public/'
              }
            }
          }
        }
        stage('Docker') {
          agent { docker 'docker:dind' }
          steps {
            sh 'docker build .'
          }
        }
      }
    }
  }
}
