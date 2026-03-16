pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'git@github.com:vikaspawar683-beep/Devops-CI-CD-project.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to App Servers') {
            steps {
                sh 'ansible-playbook -i tarraform/inventory.ini deploy-app.yml'
            }
        }

        stage('Verify Application') {
            steps {
                sh 'curl http://devops-alb-1685685824.ap-south-1.elb.amazonaws.com'
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully through Jenkins CI/CD Pipeline.'
        }
        failure {
            echo 'Pipeline failed. Check console output.'
        }
    }
}
