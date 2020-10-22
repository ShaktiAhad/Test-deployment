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
    }
    stages {
        stage('Launch new app in DEV env') {
                steps {
                    echo '### Checking and Creating ${DEV_PROJECT} project and ${APP_NAME} application###'
                    sh '''   
                        oc project ${DEV_PROJECT}
                        sleep 5

                        if { !${APP_NAME}.exists() } 
                            then
                                oc new-app --name ${APP_NAME} python:latest ${APP_GIT_URL}
                                oc expose dvc/${APP_NAME}
                        else
                            oc project ${DEV_PROJECT}
                            oc delete all --selector app=${APP_NAME}
                            oc start-build ${APP_NAME}
                            oc expose svc/${APP_NAME}
                        fi
                    '''
                }
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
