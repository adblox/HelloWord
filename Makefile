IMAGE_NAME	:= hello-world
IMAGE		:= $(IMAGE_NAME):v1
DOCKER_USERNAME := adua
DOCKER_PASSWORD := A_delta@1234567!

docker: docker-build docker-push

docker-build:
	docker build -t adua/test:v1

docker-logout:	docker logout
docker-login:	docker login --username adua --password A_delta@1234567! --email adua@infoblox.com

docker-push:
	docker push adua/test:v1
docker-pull-or-build:
	docker pull $(IMAGE) \
	|| docker image inspect $(IMAGE) > /dev/null \
	|| make docker-build

docker-pull-or-push:
	docker push $(IMAGE)

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

