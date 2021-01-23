pipeline {
  agent any
  stages {
    stage('hogehoge') {
      parallel {
        stage('hogehoge') {
          steps {
            sh 'echo \'aaaaa\';'
          }
        }

        stage('hogehgoe2') {
          steps {
            sleep 10
          }
        }
        
        stage('hogehgoe3') {
          steps {
            sh 'cccccc';
          }
        }
      }
    }

    stage('finish') {
      steps {
        sh 'echo \'Finished!\';'
      }
    }
  }
}
