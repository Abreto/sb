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
          agent { docker 'docker' }
          stages {
            stage('Build') {
              steps {
               sh 'docker build -t ci/sb-testimg .'
              }
            }
            stage('Test') {
              steps {
                sh 'apk add curl'
                sh 'docker run -d -p 3000:3000 --name ci-sb-test-container ci/sb-testimg'
                sh '''
                  HOST_IP=$(/sbin/ip route | awk '/default/ { print $3 }')
                  TEST_URI="http://${HOST_IP}:3000 http://${HOST_IP}:3000/ http://${HOST_IP}:3000/archives http://${HOST_IP}:3000/archives/"
                  for uri in $TEST_URI; do
                    curl -i "$uri"
                  done
                '''
                sh 'docker logs ci-sb-test-container'
              }
            }
          }
          post {
            always {
              sh 'docker rm -f ci-sb-test-container || true'
              sh 'docker rmi ci/sb-testimg || true'
            }
          }
        }
      }
    }
  }
}
