pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mern-devops-project .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f mern-container || true'
                sh 'docker run -d -p 5000:5000 --env-file backend/.env --name mern-container mern-devops-project'
            }
        }

        stage('Check Running Containers') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
