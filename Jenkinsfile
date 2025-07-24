pipeline {
    agent any 
    parameters{
        choice(name: 'env', choices: ['stage','prod'], description: 'Select environment')
    }
    stages{
        stage("checkout code "){
            steps {
            git branch:'master',url:'https://github.com/Drkrockzz/workspace_tf.git'
        }
        }
        stage ('building backend'){
            steps{
                dir(backend-setup/){
                    sh 'terraform init'
                    sh 'terraform plan -out=backend_tfplan'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    
        stage("Initialize Terraform"){
            steps {
                sh "terraform workspace new params.env || terraform workspace select params.env"
            }
        }
        stage("plan"){
            steps {
                sh 'terraform plan -var-file=terraform_${params.env}.tfvars -out=${params.env}_tfplan'
            }
        }
        stage('provision params.env'){
            steps{
                sh ' terraform apply -auto-approve'
            }
        }
    }
}