pipeline {

 agent any

 stages {

  stage('Checkout') {
   steps {
    git 'https://github.com/user/project.git'
   }
  }

  stage('Build') {
   steps {
    sh 'mvn clean package'
   }
  }

  stage('Docker Build') {
   steps {
    sh 'docker build -t myapp .'
   }
  }

  stage('Terraform Apply') {
   steps {
    sh 'cd terraform && terraform init'
    sh 'cd terraform && terraform apply -auto-approve'
   }
  }

  stage('Deploy') {
   steps {
    sh 'ansible-playbook ansible/deploy.yml'
   }
  }

 }

}
