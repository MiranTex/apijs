pipeline{
    agent any

    stages{
        // stage("Build"){
        //     steps{
        //         script{
        //             dockerapp = docker.build("dev-api-app", '-f dockerfile .')
        //             dockerContainer = dockerapp.run('-p 3000:3000 -d')
        //         }
        //     }
            
        // }

        stage("Install dependencies"){
            steps{
                script{
                    sh "npm install"
                }
            }
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

    }
    post{
        always{
            echo "========always========"
            script{
                sh "echo 'always'"
                // dockerContainer.stop()
            }

        }
        success{
            echo "========A executed successfully========"
        }
        failure{
            echo "========A execution failed========"
        }
    }    
}