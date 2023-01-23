// pipeline {
//     agent any
//     stages {
//         stage('Checkout') {
//             steps {
//             checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/IreneAkakpo/ECS-PROJECT.git']]]) 
//           }
//         }
 
//         stage("terraform init") {
//             steps {
//                 sh ('terraform init') 
//             }
//         }
 
//         stage ("terraform Action") {
//             steps {
//                 echo "Terraform action is --> ${action}"
//                 sh ('terraform ${action} --auto-approve') 
//             }
//         }
 
//     }
// }

pipeline {
    agent any

    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', credentialsId: 'Github', url:'https://github.com/IreneAkakpo/ECS-PROJECT.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }

        stage ("terraform Action") {
              steps {
            echo "Terraform action is --> ${action}"
                echo "Terraform environment is --> ${env}"   
                sh ('terraform ${action} -var-file=${env}.tfvars -auto-approve')
            }
        }

    }

}
