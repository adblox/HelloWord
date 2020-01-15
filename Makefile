IMAGE_NAME	:= hello_world
IMAGE		:= $(IMAGE_NAME):v1
DOCKER_USERNAME := adua
DOCKER_PASSWORD := A_delta@1234567!

docker: docker-build docker-push

docker-build:
	docker build -t adua/test:v1 .

docker-login:	docker login --username $(DOCKER_USERNAME) --password $(DOCKER_PASSWORD) --email adua@infoblox.com

docker-push:
	docker push adua/test:v1
docker-pull-or-build:
	docker pull $(IMAGE) \
	|| docker image inspect $(IMAGE) > /dev/null \
	|| make docker-build

docker-pull-or-push:
	docker push $(IMAGE) || make docker

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

