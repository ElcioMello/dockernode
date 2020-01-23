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
                    args '-p 3000:3000 -p 5000:5000 --user root' 
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
                    args '-p 3000:3000 -p 5000:5000 --user root' 
                }
            }
            steps {
                sh 'ls'
                sh 'npm test'
            }
        }
        stage('Build a Image(compose)') {
           agent any
            steps {
                sh 'docker images'
                sh 'docker build -t dockernode .'
                sh 'docker images'
                
               
            }
        }

        stage('Tag and login') {
           agent any
            steps {
                sh 'docker images'
                sh 'docker tag dockernode mycontainerregelcio01.azurecr.io/dockernode:v1'
                sh 'docker images'
                sh 'docker login mycontainerregelcio01.azurecr.io -u mycontainerregelcio01 -p EjrxA/Mo0cFehFAkE2MDggMeHy9SHfxu'
               
            }
        }

         

         stage('Push Image') {
           agent any
            steps {
                sh 'docker images'
                sh 'docker push mycontainerregelcio01.azurecr.io/dockernode:v1'
               
            }
        }

        stage('Aply Azure YAML') {
           agent any
            steps {
                sh 'kubectl apply -f azure-dockernode.yaml'
               
            }
        }

    }
}