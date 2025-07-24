pipeline {
    agent any 
    parameters{
        choice(name: 'env', choices: ['stage','prod'], descriprion: 'Select environment')
    }
    stages{
        stage("checkout code "){
            steps {
            git branch:'' url:''
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
    }
}