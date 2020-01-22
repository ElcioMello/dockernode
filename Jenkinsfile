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
                sh 'id'
                sh 'chmod -R 777 /home/pzerger/.azure/config'
                sh 'chmod -R 777 /home/pzerger/.azure'
                sh 'az --version'

            }
        }

    }
}