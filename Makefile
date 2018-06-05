####################
# This Makefile is a snippet defining common targets for all concrete Makefiles
# in the directories below, which include it. It's based on the makefile
# explained in https://github.com/jmkhael/make-for-docker.

IMAGE_NAME := gnustavo/$(shell basename $(PWD))

.PHONY: build shell push

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile .

shell:
	docker run --rm -i -t --entrypoint /bin/bash $(IMAGE_NAME)

push: $(HOME)/.docker/config.json
	docker push $(IMAGE_NAME)

$(HOME)/.docker/config.json:
	docker login $(IMAGE_REGISTRY)

