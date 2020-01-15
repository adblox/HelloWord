pipeline {
  agent {
    label 'ubuntu_docker_label'
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
        sh 'docker network create java-network4'
        sh 'docker run -p 3030:8080 --net java-network4 --name hello-test6-java adua/test'
        container_ip=sh 'docker inspect --format "{{ .NetworkSettings.IPAddress }}" hello-test6-java'
        
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
