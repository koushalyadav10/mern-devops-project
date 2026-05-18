pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'eval $(minikube docker-env) && docker build -t mern-devops-project .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl apply -f service.yml'
            }
        }

        stage('Restart Kubernetes Deployment') {
            steps {
                sh 'kubectl rollout restart deployment mern-app'
            }
        }

        stage('Check Kubernetes Resources') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }
}
