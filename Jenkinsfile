pipeline{
    agent any

    stages{
        stage("Build"){
            steps{
                script{
                    dockerapp = docker.build("dev-api-app", '-f dockerfile .')
                    dockerContainer = dockerapp.run('-p 3000:3000 -d')
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
                    // dockerContainer.inside{
                        // Optionally clear the npm cache
                        // sh 'npm cache clean --force'
                        
                        // Install dependencies
                        // sh 'npm install --no-lockfile'
                        
                        // Run unit tests
                        // sh 'npm test'
                
                    // }
                }
            }
   
        }

        
    }
    post{
        always{
            echo "========always========"
            # Stop and remove the container
            dockerContainer.stop()
        }
        success{
            echo "========A executed successfully========"
        }
        failure{
            echo "========A execution failed========"
        }
    }
}