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
                    args '-p 3000:3000 -p 5000:5000' 
                }
            }
            steps {
                sh 'ls'
                sh 'npm install -g azure-cli'
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
            }
        }
        stage('Unit Test') {
            agent {
                docker {
                    image 'node:13.6.0-alpine'
                    args '-p 3000:3000 -p 5000:5000' 
                }
            }
            steps {
                sh 'ls'
                sh 'npm test'
            }
        }
        stage('Build e Push Docker') {
            agent {
                docker {
                    image 'docker/compose:latest'
                }
            }
            steps {
                sh 'ls'
                sh 'docker images'
                sh 'docker-compose up -d'
                sh 'docker images'
                sh 'docker ps'
                sh 'docker-compose down'
                sh 'docker tag dockernode mycontainerregelcio01.azurecr.io/dockernode:v1'
                sh 'docker push mycontainerregelcio01.azurecr.io/dockernode:v1'
               
            }
        }

    }
}