pipeline {

 agent any

 stages {

  stage('Checkout') {

   steps {

    git 'https://github.com/vikaspawar683-beep/Devops-CI-CD-project.git'

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
