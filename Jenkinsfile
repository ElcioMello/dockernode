pipeline {
    agent none
    stages {
        
        stage('Build') {
            agent {
                docker {
                    image 'mcr.microsoft.com/azure-cli'
                }
            }
            steps {
                sh 'whoami'
                sh 'az --version'

            }
        }

    }
}