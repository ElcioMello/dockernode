pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    stage('Install') { 
            steps {
                sh 'npm install' 
            }
        }
    stages {
        stage('Unit Test') { 
            steps {
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