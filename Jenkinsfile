def gv = load "jenkin.groovy"

pipeline {
    agent { 
        node {
            label 'master'
      }
    }
    
    environment { 
        APP_NAME = 'demo'
    }

    stages {
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
