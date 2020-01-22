pipeline {
    agent {
        docker {
            image 'node:13.6.0-slim' 
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
                sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
                sh 'az --version'
                
            }
        }

    }
}