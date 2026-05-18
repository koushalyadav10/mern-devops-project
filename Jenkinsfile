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

                sh '''
                docker run -d \
                -p 5001:5000 \
                --network bridge \
                -e PORT=5000 \
                -e MONGO_URI=mongodb://172.17.0.1:27017/ecommerce \
                -e UPSTASH_REDIS_URL=redis://172.17.0.1:6379 \
                -e ACCESS_TOKEN_SECRET=myaccesssecret \
                -e REFRESH_TOKEN_SECRET=myrefreshsecret \
                -e CLOUDINARY_CLOUD_NAME=test \
                -e CLOUDINARY_API_KEY=test \
                -e CLOUDINARY_API_SECRET=test \
                -e STRIPE_SECRET_KEY=test \
                -e CLIENT_URL=http://localhost:5173 \
                -e NODE_ENV=development \
                --name mern-container \
                mern-devops-project
                '''
            }
        }

        stage('Check Running Containers') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
