IMAGE_NAME	:= hello_world
IMAGE		:= $(IMAGE_NAME):v1
DOCKER_USERNAME := adua
DOCKER_PASSWORD := A_delta@1234567!

docker: docker-build docker-push

docker-build:
	docker build -t adua/spinnaker-test/$(IMAGE) .

docker-login:	docker login --username adua --password A_delta@1234567! --email adua@infoblox.com

docker-push:
	docker push adua/spinnaker-test/$(IMAGE)
docker-pull-or-build:
	docker pull $(IMAGE) \
	|| docker image inspect $(IMAGE) > /dev/null \
	|| make docker-build

docker-pull-or-push:
	docker push $(IMAGE) || make docker

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

