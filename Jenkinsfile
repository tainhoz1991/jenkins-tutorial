pipeline{
    agent{
        label "jenkins-agent"
    }
    tools{
        jdk 'Java11'
        maven 'Maven3'
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
    }
}