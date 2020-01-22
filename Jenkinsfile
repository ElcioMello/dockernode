pipeline {
    agent {
        docker {
            image 'node:lts-alpine3.11' 
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
                sh 'set -x'
                sh 'npm install --save-dev cross-env'
                sh 'set +x'
                sh 'ls'
                sh 'npm test' 
            }
        }
        stage('Build') { 
            steps {
                echo 'Building..' 
            }
        }
    }
}