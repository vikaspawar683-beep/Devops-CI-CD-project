pipeline {

 agent any

 stages {

  stage('Checkout') {

   steps {

    git 'https://github.com/YOUR_USERNAME/devops-cicd-project.git'

   }

  }

  stage('Build') {

   steps {

    sh 'mvn clean package'

   }

  }

  stage('Docker Build') {

   steps {

    sh 'docker build -t devops-app .'

   }

  }

  stage('Terraform Deploy') {

   steps {

    sh 'cd terraform && terraform init'

    sh 'cd terraform && terraform apply -auto-approve'

   }

  }

  stage('Deploy App') {

   steps {

    sh 'ansible-playbook ansible/deploy.yml'

   }

  }

 }

}
