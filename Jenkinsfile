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
                sh 'id'
                sh 'whoami'
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
                sh 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | tee /etc/apt/sources.list.d/azure-cli.list'
                sh 'apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893'
                sh 'apt-get install apt-transport-https'
                sh 'apt-get update && sudo apt-get install azure-cli'
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
                }
            }
            steps {
                sh 'id'
                sh 'whoami'
                sh 'az --version'

            }
        }

    }
}