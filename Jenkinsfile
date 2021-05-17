pipeline {
    agent any

    environment { 
        APP_NAME = 'demo'
    }

    stages {
        stage('Init') {
            steps {
                script{
                    gv = load "jenkin.groovy"
                }
            }
        }
        stage('Build') {
            steps {
                script{
                    gv.buildapp()
                }
            }
        }
        stage('Test') {
            steps {
                script{
                    gv.testapp()
                }  
            }
        }
        stage('Deploy') {
            steps {
                script{
                    gv.deployapp()
                }
            }
        }
    }
}
