IMG_REPO ?= rafaelcalleja
IMG_TAG ?= $(MKS_VERSION)
IMG_NAME ?= makefile-templates

default: image

include src/Makefile.mk

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	.
push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)
