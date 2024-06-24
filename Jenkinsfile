pipeline {
    agent any
    
    stages {
        
        stage("code"){
            steps{
                git url: "https://github.com/janvi2021/node-todo-cicd-DevSecOps", branch: "master"
                echo 'code clone ho gaya'
            }
        }
        stage("build and test"){
            steps{
                sh "docker build -t node-app-test-new ."
                echo 'code build bhi ho gaya'
            }
        }
        stage("scan image"){
            steps{
                echo 'image scanning ho gayi'
            }
        }
        stage("push"){
            steps{
                sh "docker login -u janvi20 p  "
                sh "docker tag node-app-test-new:latest janvi20/node-app-test-new:latest"
                sh "docker push janvi20/node-app-test-new:latest"
                echo 'image push ho gaya'
                
            }
        }
        
    }
}

