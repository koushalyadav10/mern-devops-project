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
                docker run -d -p 5000:5000 \
                -e PORT=5000 \
                -e MONGO_URI=mongodb://host.docker.internal:27017/ecommerce \
                -e UPSTASH_REDIS_URL=dummy \
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
