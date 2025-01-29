pipeline {
    agent any

    environment {
        CONTAINER_NAME = 'todolist-app'
        BUILD_TAG = "${env.BUILD_NUMBER}"
        DOCKER_IMAGE = "${CONTAINER_NAME}:${BUILD_TAG}"
        REPO_URL = 'https://github.com/dev-alex-ops/todo-list-react'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "main", url: "${REPO_URL}"
            }
        }
        
        stage('Cleanup Existing Container') {
            steps {
                script {
                    sh '''
                    if [ $(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                        echo "Deteniendo y eliminando contenedor existente: ${CONTAINER_NAME}"
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                    else
                        echo "No existe un contenedor con el nombre: ${CONTAINER_NAME}"
                    fi
                    '''
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                }
            }
        }
    }
    
    post {
        always {
            sh 'docker system prune -af'
        }
    }
}