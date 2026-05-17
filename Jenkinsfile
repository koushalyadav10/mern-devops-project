pipeline {
    agent any

    stages {

        stage('Build Docker Containers') {
            steps {
                sh 'docker build -t mern-devops-project .'
            }
        }

        stage('Run Containers') {
            steps {
                sh 'docker run -d -p 3000:3000 --name mern-container mern-devops-project'
            }
        }

        stage('Check Running Containers') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
