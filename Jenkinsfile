pipeline{
    agent{
        label "jenkins-agent"
    }
    tools{
        jdk 'Java11'
        maven 'Maven3'
    }
    environment{
        APP_NAME = "jenkins-tutorial"
        RELEASE = "1.0.0"
        DOCKER_USER = "taithan"
        DOCKER_PASSWORD = "docker_hub"
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }
    stages{
        stage("Clean workspace"){
            steps{
                cleanWs()
            }
        }
        stage("Check out from SCM"){
            steps{
                git branch: 'main', url: 'https://github.com/tainhoz1991/jenkins-tutorial'
            }
        }
        stage("Building Application"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Testing Application"){
            steps{
                sh "mvn test"
            }
        }
        stage("Build and Push Dokcer image"){
            steps{
                script{
                    docker.withRegistry('', DOCKER_PASS){
                        docker_image = docker.build "${IMAGE_NAME}"
                    }
                    docker.withRegistry('', DOCKER_PASS){
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push("latest")
                    }
                }
            }
        }
    }
}