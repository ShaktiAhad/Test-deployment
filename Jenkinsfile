pipeline {
    agent {
      node {
        label 'master'
      }
    }
    environment {
        DEV_PROJECT = "python-app"
        APP_NAME = "python-hello"
        APP_GIT_URL = "https://github.com/ShaktiAhad/Test-deployment.git"
        CONTEXT_DIR = "test"
    }
    stages {
        stage('Launch new app in DEV env') {
                steps {
                    sh '''   
                        oc project ${DEV_PROJECT}
                        sleep 5
                    '''
        }

        stage('Wait for S2I build to complete') {
                steps {
                    script {
                        openshift.withCluster() {
                            openshift.withProject( "${DEV_PROJECT}" ) {
                                def bc = openshift.selector("bc", "${APP_NAME}")
                                bc.logs('-f')
                                def builds = bc.related('builds')
                                builds.untilEach(1) {
                                    return (it.object().status.phase == "Complete")
                                }
                            }
                        }
                    }
                }
            }

        stage('Wait for deployment in DEV env') {
            steps {
                script {
                    openshift.withCluster() {
                        openshift.withProject( "${DEV_PROJECT}" ) {
                            echo "Deployment is done!"
                            }
                        }
                    }
                }
            }
        }
    }
