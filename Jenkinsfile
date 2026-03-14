pipeline {
    agent any

    stages {

        stage('Git Pull') {
            steps {
                git 'git@github.com:vikaspawar683-beep/Devops-CI-CD-project.git'
            }
        }

        stage('Maven Build') {
            steps {
                dir('app') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Docker Build') {
            steps {
                dir('app') {
                    sh 'docker build -t java-app .'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Get Public IP') {
            steps {
                script {
                    def ip = sh(
                        script: "cd terraform && terraform output -raw public_ip",
                        returnStdout: true
                    ).trim()

                    sh "sed -i 's/IP/${ip}/g' ansible/inventory.ini"
                }
            }
        }

        stage('Ansible Deploy') {
            steps {
                sh 'ansible-playbook -i ansible/inventory.ini ansible/deploy.yml'
            }
        }
    }
}
