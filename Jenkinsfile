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
                sh 'rm package-lock.json'
                sh 'rm -r node_modules'
                sh 'npm cache clean --force'
                sh 'npm rebuild'
                sh 'npm install'
            }
        }
        stage('Unit Test') {
            agent {
                docker {
                    image 'node:alpine'
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
                sh 'ls'
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
                
                withCredentials([azureServicePrincipal(credentialsId: 'AzureTeste',
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
                withCredentials([azureServicePrincipal(credentialsId: 'AzureLogin',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) {
                                        sh 'az login --service-principal -u $CLIENT_ID --password $CLIENT_SECRET --tenant $TENANT_ID'
                                    }
                sh 'az acr list --resource-group myResourceGroup --query "[].{acrLoginServer:loginServer}" --output'
                sh 'kubectl apply -f azure-dockernode.yaml'
            }
        }


    }
}