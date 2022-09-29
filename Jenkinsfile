pipeline {
    agent any

    stages {
        stage(maven){
            steps{
                    sh 'mvn clean install -DskipTests'
            }
        }
        stage('Docker') {
            steps{
                sh 'docker build -t demo .'
            }
        }
        stage('Docker login') {
            steps{
                sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/d4e7k9t6'
            }
        }
        stage('Docker tag') {
            steps{
                sh 'docker tag demo:latest public.ecr.aws/d4e7k9t6/demo:$BUILD_NUMBER'
            }
        }        
        stage('Docker push') {
            steps{
                sh 'docker push public.ecr.aws/d4e7k9t6/demo:$BUILD_NUMBER'
            }
        }
     }
 }
