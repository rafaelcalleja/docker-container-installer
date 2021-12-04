CURRENT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VENDOR_PATH := $(CURRENT_DIR)/mks/
MKS_VERSION := $(shell cat VERSION)

IMG_REPO ?= rafaelcalleja
IMG_TAG ?= $(MKS_VERSION)
IMG_NAME ?= makefile-templates

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	.
push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)

test:
	@echo $(MKS_VERSION)