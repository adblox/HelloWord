pipeline {
  agent {
    label 'ubuntu_docker_label'
  }
environment {
  registry_url="hub.docker.com"
  registryCredential = 'dockerhub-cicd-ashish' //Created in Jenkins with ID
  }
stages
{
stage('Build Image')
{
  steps{
  script{
    docker.withRegistry("https://${registry_url}",'dockerhub-cicd-ashish'){
def testImage = 'make docker-build'
}
  }
}
}
stage('Deploying Image to Docker Registry')
{
steps{
script{
  docker.withRegistry("https://${registry_url}",'dockerhub-cicd-ashish'){
testImage.push()
}
}
}
}
stage('Deploy Image to K8 cluster')
{
steps{
script{
kubectl apply -f jenkins-deployment.yaml
kubectl apply -f jenkins-service.yaml
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

