pipeline {
    agent any
    // environment{
    //     SONAR_HOME= tool "sonar"
    // }    
    
    stages {
        
        stage("code checkout"){
            steps{
                git url: "https://github.com/janvi2021/node-todo-cicd-DevSecOps", branch: "master"
                echo 'code clone ho gaya'
            }
        }
        
        // stage("SonarQube Analysis"){
        //     steps{
        //         withSonarQubeEnv("sonar-server"){
        //             sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=nodetodo -Dsonar.projectKey=nodetodo"
        //         }
        //     }
        // }

        
        stage("build and test"){
            steps{
                sh "docker build -t node-app-test-new ."
                echo 'code build bhi ho gaya'
            }
        }

        stage("Docker Code Scan: Trivy"){
            steps{
                sh "trivy image node-app-test-new"
                echo 'image scanning ho gayi'
            }
        }
        
        
        stage("push"){
            steps{
                // sh "docker login -u janvi20  "
                withDockerRegistry(credentialsId: 'dockerhub-credentials-id', toolName: 'docker') {
                // withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){
                sh "docker tag node-app-test-new:latest janvi20/node-app-test-new:latest"
                sh "docker push janvi20/node-app-test-new:latest"
                echo 'image push ho gaya'
                
            }
        }
    }
      // stage("Docker Build & Push"){
      //       steps{
      //           script{
      //              withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){   
      //                  sh "docker build --build-arg TMDB_V3_API_KEY=<yourapikey> -t netflix ."
      //                  sh "docker tag netflix nasi101/netflix:latest "
      //                  sh "docker push nasi101/netflix:latest "
      //               }
      //           }
      //       }
      //   }
        
    }
}

