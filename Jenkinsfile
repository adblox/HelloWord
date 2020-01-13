pipeline {
  agent {
    label 'master'
  }
environment {
  registry_url="hub.docker.com/adua/test"
  registryCredential = 'dockerhub-cicd-ashish' //Created in Jenkins with ID
  }
stages
{
stage('Build Image')
{
  agent{
      dockerfile true
  }
steps{
  script{
def testImage = docker.build registry + ":v1"
}
}
}
stage('Deploying Image to Docker Registry')
{
  agent{
    dockerfile true
  }
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
  agent {
    kubernetes {
      label 'promo-app'  // all your pods will be named with this prefix, followed by a unique id
      idleMinutes 5  // how long the pod will live after no jobs have run on it
      yamlFile 'jenkins-deployment.yaml'  // path to the pod definition relative to the root of our project 
      }
  }
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

