pipeline {
    agent {
        docker {
            image 'microsoft/azure-cli' 
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
                sh 'az --version'
                sh 'az --version'
                
            }
        }

    }
}
