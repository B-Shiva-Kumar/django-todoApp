pipeline {
    agent any
    
    stages{
        
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url: "https://github.com/B-Shiva-Kumar/django-todoApp.git", branch: "develop"
            }
            
        }
        stage("Build"){
            steps {
                echo "Building the code"
                
                sh "docker build . -t todoapp"
            }
        }
        stage("PUSH to Dockerhub"){
            steps {
                echo "Pushing the image to Dockerhub"
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                    sh "docker tag todoapp ${env.dockerhubUser}/todoapp:latest"
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                    sh "docker push ${env.dockerhubUser}/todoapp:latest"
                }
            }
        }
        stage("Deploy"){
            steps {
                echo "Deploying the code"
                sh "docker-compose down && docker-compose up -d"
            }
        }

    }
}
