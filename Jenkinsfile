pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Install') { 
            steps {
                sh 'apt install nodejs'
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
                echo 'Building..' 
            }
        }
    }
}