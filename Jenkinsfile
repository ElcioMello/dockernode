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
                sh 'npm install -g azure-cli'
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
                sh 'azure --version'
                
            }
        }

    }
}
