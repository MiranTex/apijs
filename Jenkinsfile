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

        stage("Test app"){

            steps{
                script{
                    docker.image("dev-api-app").withRun('-p 8080:8080') {
                        sh 'sleep 30'
                        sh 'curl http://localhost:8080'
                    }
                }
            }
        }
    }
}