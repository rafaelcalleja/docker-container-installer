IMG_REPO ?= rafaelcalleja
IMG_TAG ?= 0.0.1
IMG_NAME ?= docker-container-installer

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	.
push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)

test:
	./docker-hub/test.sh
