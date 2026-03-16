pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven3'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'git@github.com:vikaspawar683-beep/Devops-CI-CD-project.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy Application') {
            steps {
                sh 'ansible-playbook -i tarraform/inventory.ini ansible/deploy-app.yml'
            }
        }

        stage('Verify ALB') {
            steps {
                sh 'curl http://devops-alb-1685685824.ap-south-1.elb.amazonaws.com'
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check console output.'
        }
    }
}
