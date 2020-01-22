pipeline {
    agent none
    stages {
        stage('Install') {
            agent {
                docker {
                    image 'node:13.6.0'
                    args '-p 3000:3000'
                }
            }
            steps {
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
            }
        }
        stage('Unit Test') {
            agent {
                docker {
                    image 'node:13.6.0'
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
                sh 'docker-compose up -d'
                sh 'docker images'
                sh 'docker ps'
                sh 'docker-compose down'
                sh 'az acr login --name mycontainerregelcio01'
                sh 'docker tag dockernode mycontainerregelcio01.azurecr.io/dockernode:v1'
                sh 'docker push mycontainerregelcio01.azurecr.io/dockernode:v1'
            }
        }

    }
}