pipeline {
  agent { docker 'node:lts' }
  environment {
    CI = 'true'
  }
  stages {
    stage('Prepare') {
      steps {
        sh 'yarn'
      }
    }
    stage('Build') {
      steps {
        sh 'yarn build'
        archiveArtifacts 'public'
      }
    }
  }
}
