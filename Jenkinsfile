pipeline{
    agent any

    stages{
        stage("Build"){
            steps{
                script{
                    dockerapp = docker.build("dev-api-app", '-f dockerfile .')
                }
            }
            // post{
            //     always{
            //         echo "========always========"
            //     }
            //     success{
            //         echo "========A executed successfully========"
            //     }
            //     failure{
            //         echo "========A execution failed========"
            //     }
            // }
        }

        // stage("Push Image") {
        //     steps{
        //         script{
        //             docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
        //                 dockerapp.push("latest")
        //                 dockerapp.push("${env.BUILD_ID}")
        //             }
        //         }
        //     }
        
        // }

        stage("Run unit tests"){
            steps{
                script{
                    dockerapp.inside{
                        sh 'mkdir -p ~/.npm && chown -R $(id -u):$(id -g) ~/.npm'
                        
                        // Optionally clear the npm cache
                        sh 'npm cache clean --force'
                        
                        // Install dependencies
                        sh 'npm install --no-lockfile'
                        
                        // Run unit tests
                        sh 'npm test'
                
                    }
                }
            }
   
        }

        
    }
}