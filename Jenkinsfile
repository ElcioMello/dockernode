pipeline {
    agent none
    stages {
        
        stage('Build') {
            agent {
                docker {
                    image 'mcr.microsoft.com/azure-cli'
                    args '--user root'
                }
            }
            steps {
                sh 'id'
                sh 'az --version'

            }
        }

    }
}