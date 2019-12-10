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
          stages {
            stage('Build') {
              steps {
               sh 'docker build -t sb .'
              }
            }
            stage('Test') {
              steps {
                sh 'apk add curl'
                sh 'docker run -d -p 3000:3000 --name sb sb'
                sh '''
                  TEST_URI='http://127.0.0.1:3000 http://127.0.0.1:3000/ http://127.0.0.1:3000/archives http://127.0.0.1:3000/archives/'
                  for uri in $TEST_URI; do
                    curl -i "$uri"
                  done
                '''
                sh 'docker logs sb'
              }
            }
          }
        }
      }
    }
  }
}
