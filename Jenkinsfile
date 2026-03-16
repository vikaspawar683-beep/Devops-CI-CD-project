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
    }

    post {
        success {
            echo 'Application deployed successfully on App1 and App2.'
        }
        failure {
            echo 'Pipeline failed. Please check console output.'
        }
    }
}
