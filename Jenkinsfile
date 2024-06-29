pipeline {
    agent any

    stages {
        stage("Code Checkout") {
            steps {
                // Clone the repository and checkout the 'master' branch
                git url: "https://github.com/janvi2021/node-todo-cicd-DevSecOps", branch: "master"
                echo 'Code checkout completed.'
            }
        }

        /* Uncomment if you plan to use SonarQube for code analysis
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv("sonar-server") {
                    sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=nodetodo -Dsonar.projectKey=nodetodo"
                }
            }
        }
        */

        stage("Build and Test") {
            steps {
                sh "docker build -t node-app-test-new ."
                echo 'Docker build completed.'
            }
        }

        stage("Docker Code Scan: Trivy") {
            steps {
                // Run Trivy scan on the built image
                sh "trivy image node-app-test-new"
                echo 'Docker image scan completed.'
            }
        }

        stage("Push Docker Image") {
            steps {
                // Use Docker credentials stored in Jenkins
                withDockerRegistry(credentialsId: 'dockerhub-credentials-id', url: 'https://index.docker.io/v1/') {
                    // Tag the Docker image for Docker Hub
                    sh "docker tag node-app-test-new:latest janvi20/node-app-test-new:latest"
                    // Push the Docker image to Docker Hub
                    sh "docker push janvi20/node-app-test-new:latest"
                    echo 'Docker image push completed.'
                }
            }
        }
    }
}
