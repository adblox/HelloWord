pipeline {
  agent {
    label 'docker_17.12.0_docker-compose_label'
  }
environment {
  registry_url="https://hub.docker.com"
  registryCredential = 'dockerhub-cicd-ashish' //Created in Jenkins with ID
  }
stages
{
stage('Build Image')
{
  steps{
  script{
    image = sh 'make docker-build'
   sh 'docker login --username adua --password A_delta@1234567!'
   sh 'make docker-push'

}
}
}
stage('Deploy Docker Image')
  {
    steps{
      script
      {
        sh 'docker pull adua/test:v1'
        sh 'docker-compose up'
        sh 'docker swarm init'
        sh 'docker stack deploy -c docker-compose.yml test-python'
       }
    }
  }
stage('Upload Artifact to s3 Bucket')
{
steps{
dir('/Path to jenkins job artifact or path to Project workspace')
{

withAWS(region:'S3 Region to where artifacts need to be uploaded',credentials:'AWS Credentials created where EC2 instance for Jenkins server resides')
{
s3Upload(bucket:"yourBucketName", workingDir:'dist', includePathPattern:'**/*');
}
}
}
}
}
}
