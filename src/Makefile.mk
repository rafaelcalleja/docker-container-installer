CURRENT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
VENDOR_PATH := $(CURRENT_DIR)/mks/
MKS_VERSION := $(shell cat $(CURRENT_DIR)/VERSION)

test:
	@echo $(MKS_VERSION)