IMAGE_DEPS	:= Dockerfile .
IMAGE_NAME	:= adblox/test
IMAGE_TAG	:= $(shell git describe --long --tags --match=v0.0.0 `git diff -s --exit-code $(IMAGE_DEPS) && git log -n 1 --pretty=format:%h -- $(IMAGE_DEPS) || echo '--dirty'`)
IMAGE		:= $(IMAGE_NAME):v1

docker: docker-build docker-push

docker-build:
	docker build -t $(IMAGE) .

docker-push:
	docker push $(IMAGE)

docker-pull-or-build:
	docker pull $(IMAGE) \
	|| docker image inspect $(IMAGE) > /dev/null \
	|| make docker-build

docker-pull-or-push:
	docker pull $(IMAGE) || make docker

docker-show-version:
	@echo -n $(IMAGE)
	@echo > /dev/stderr

test: test-atlas

test-atlas: docker-pull-or-build
	$(RUNNER) "cd deployment/atlas && make test -j$(shell nproc 2> /dev/null || echo 8)"
