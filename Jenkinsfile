pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven3'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:vikaspawar683-beep/Devops-CI-CD-project.git'
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

        stage('Verify Application') {
            steps {
                sh '''
                    sudo -u jenkins ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/final-devops-key.pem ubuntu@13.234.213.7 "curl -f http://localhost:8080"
                    sudo -u jenkins ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/final-devops-key.pem ubuntu@13.126.156.47 "curl -f http://localhost:8080"
                '''
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
