IMAGE_NAME	:= hello-world
IMAGE		:= $(IMAGE_NAME):v1
DOCKER_USERNAME := adua
DOCKER_PASSWORD := A_delta@1234567!

docker: docker-build docker-push

docker-build:
	docker build -t adua/test:v1 .

docker-push:
	docker push adua/test:v1

kubectl-deploy:	kubectl apply -f jenkins-deployment.yaml

kubectl-service:kubectl apply -f jenkins-service.yaml

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

