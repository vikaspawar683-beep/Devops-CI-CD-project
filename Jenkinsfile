pipeline {
    agent any

    tools {
        jdk 'jdk21'
        maven 'maven3'
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

        stage('Verify App1') {
            steps {
                sh '''
                    for i in 1 2 3 4 5; do
                        STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://13.234.213.7:8080)
                        echo "App1 Attempt $i - HTTP Status: $STATUS"
                        if [ "$STATUS" = "200" ]; then
                            exit 0
                        fi
                        sleep 15
                    done
                    echo "App1 verification failed."
                    exit 1
                '''
            }
        }

        stage('Verify App2') {
            steps {
                sh '''
                    for i in 1 2 3 4 5; do
                        STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://13.126.156.47:8080)
                        echo "App2 Attempt $i - HTTP Status: $STATUS"
                        if [ "$STATUS" = "200" ]; then
                            exit 0
                        fi
                        sleep 15
                    done
                    echo "App2 verification failed."
                    exit 1
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
