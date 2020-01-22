pipeline {
    agent {
        docker {
            image 'node:13.6.0' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Install') { 
            steps {
                sh 'node --version'
                sh 'npm --version'
                sh 'npm install' 
            }
        }
        stage('Unit Test') { 
            steps {
                sh 'ls'
                sh 'npm test' 
            }
        }
        stage('Build') { 
            steps {
                sh 'apt-get update'
                sh 'apt-get install ca-certificates curl apt-transport-https lsb-release gnupg'
                sh 'curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null'
                sh 'AZ_REPO=$(lsb_release -cs)'
                sh 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list'
                sh 'apt-get update'
                sh 'apt-get install azure-cli'
                sh 'az --version'
                
            }
        }

    }
}