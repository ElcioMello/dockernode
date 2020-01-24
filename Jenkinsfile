pipeline {
    agent none
    environment {
        CI = 'true'
    }
    stages {
        stage('Install') {
            agent {
                docker {
                    image 'node:alpine'
                    args '-p 3000:3000 -p 5000:5000 --add-host="registry.npmjs.org npmjs.org registry.npmjs.com npmjs.com:104.16.110.30"'
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
                    image 'node:alpine'
                    args '-p 3000:3000 -p 5000:5000 --user root --add-host="registry.npmjs.org npmjs.org registry.npmjs.com npmjs.com:104.16.110.30"'
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
                sh 'docker build --add-host="registry.npmjs.org npmjs.org registry.npmjs.com npmjs.com:104.16.110.30" -t dockernode .'
                sh 'docker images'


            }
        }

        stage('Tag and Login') {
            agent any
            steps {
                script {
                    def version = readFile('VERSION')
                    def versions = version.split('\\.')
                    def major = versions[0]
                    def minor = versions[0] + '.' + versions[1]
                    def patch = version.trim()
                    
                    echo 'version'
                    }

                sh 'docker images'
                sh 'docker tag dockernode mycontainerregelcio01.azurecr.io/dockernode:v2'
                sh 'docker image prune --all'
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
                sh 'docker push mycontainerregelcio01.azurecr.io/dockernode:v2'

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
                sh 'echo "login"'
                withCredentials([azureServicePrincipal(credentialsId: 'AzureLogin',
                                    subscriptionIdVariable: 'SUBS_ID',
                                    clientIdVariable: 'CLIENT_ID',
                                    clientSecretVariable: 'CLIENT_SECRET',
                                    tenantIdVariable: 'TENANT_ID')]) {
                                        sh 'az login --service-principal -u $CLIENT_ID --password $CLIENT_SECRET --tenant $TENANT_ID'
                                    }
                sh 'az aks install-cli'
                sh 'az aks get-credentials --resource-group myResourceGroup --name myAKSCluster'
                sh 'az acr list --resource-group myResourceGroup --query "[].{acrLoginServer:loginServer}" --output table'
                sh 'kubectl apply -f azure-dockernode.yaml'
                sh 'kubectl get service dockernode'
            }
        }


    }
}