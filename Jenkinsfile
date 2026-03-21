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
                    for i in 1 2 3 4 5; do
                        echo "Checking app1 attempt $i"
                        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/final-devops-key.pem ubuntu@13.234.213.7 "curl -sS --max-time 10 http://localhost:8080" && break
                        sleep 10
                        if [ "$i" = "5" ]; then
                            echo "app1 verification failed"
                            exit 1
                        fi
                    done

                    for i in 1 2 3 4 5; do
                        echo "Checking app2 attempt $i"
                        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/final-devops-key.pem ubuntu@13.126.156.47 "curl -sS --max-time 10 http://localhost:8080" && break
                        sleep 10
                        if [ "$i" = "5" ]; then
                            echo "app2 verification failed"
                            exit 1
                        fi
                    done
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
