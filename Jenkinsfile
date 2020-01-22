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

                sh 'node --version'
                sh 'npm --version'
                sh 'npm install'
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
                sh 'az --version'

            }
        }

    }
}