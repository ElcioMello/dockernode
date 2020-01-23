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

        stage('Tag and Login') {
            agent any
            steps {
                sh 'docker images'
                sh 'docker tag dockernode mycontainerregelcio01.azurecr.io/dockernode:v1'
                sh 'docker images'
                withCredentials([azureServicePrincipal(credentialsId: 'AzureServicePrincipal',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) {
        sh 'docker login mycontainerregelcio01.azurecr.io -u $CLIENT_ID -p $CLIENT_SECRET'
    }
               
                
            }
        }



        stage('Push  Image') {
            agent any
            steps {
                sh 'docker images'
                sh 'docker push mycontainerregelcio01.azurecr.io/dockernode:v1'

            }
        }

        stage('Aply Azure Yaml') {
            agent {
                docker {
                    image 'mcr.microsoft.com/azure-cli'
                    args '-p 3000:3000 -p 5000:5000 --user root'
                }
            }
            steps {
                sh 'az --version'
                sh 'az aks install-cli'
                sh 'kubectl apply -f azure-dockernode.yaml'
            }
        }


    }
}