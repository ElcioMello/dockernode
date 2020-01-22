pipeline {
    agent none
    environment {
        CI = 'true'
    }
    stages {
        stage('Install') {
            agent {
                docker {
                    image 'node:13.6.0-alpine'
                    args '-p 3000:3000'
                }
            }
            steps {
                sh 'ls'
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
            }
        }
        stage('Unit Test') {
            agent {
                docker {
                    image 'node:13.6.0-alpine'
                    args '-p 3000:3000'
                }
            }
            steps {
                sh 'ls'
                sh 'npm test'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'mcr.microsoft.com/azure-cli'
                    args '--user root'
                }
            }
            steps {
                sh 'ls'
                 sh 'docker images'
                sh 'docker-compose up -d'
                sh 'docker images'
                sh 'docker ps'
                sh 'docker-compose down'
               
            }
        }

    }
}