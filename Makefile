IMAGE_NAME	:= adblox/test
IMAGE		:= $(IMAGE_NAME):v1
DOCKER_USERNAME :=adua
DOCKER_PASSWORD :=a_DELTA@1234567!

docker: docker-build docker-push

docker-build:
	docker build -t $(IMAGE) .

docker-login:
        docker login -u $(DOCKER_USERNAME) -P $(DOCKER_PASSWORD)

docker-push:
	docker push $(IMAGE)

docker-pull-or-build:
	docker pull $(IMAGE) \
	|| docker image inspect $(IMAGE) > /dev/null \
	|| make docker-build

docker-pull-or-push:
	docker push $(IMAGE) || make docker

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

