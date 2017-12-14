IMAGE_NAME := gnustavo/$(shell basename $(PWD))

.PHONY: build shell

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile .

shell:
	docker run --rm -i -t $(IMAGE_NAME) /bin/bash
