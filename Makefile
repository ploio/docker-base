# Copyright (C) 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

APP=portefaix
NAMESPACE=$(APP)

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

DOCKER = docker

ifneq ($(image),)
IMAGE_VERSION := $(shell grep ' VERSION' ${image}/Dockerfile|awk -F" " '{ print $$3 }')
endif

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- build     : Make the Docker image"
	@echo -e "$(WARN_COLOR)- publish   : Publish the image"

.PHONY: build
build:
	@echo -e "$(OK_COLOR)[$(APP)] Build $(NAMESPACE)/$(image):$(IMAGE_VERSION)$(NO_COLOR)"
	@$(DOCKER) build -t $(NAMESPACE)/$(image):$(IMAGE_VERSION) $(image)

.PHONY: login
login:
	@$(DOCKER) login https://index.docker.io/v1/

.PHONY: publish
publish:
	@echo -e "$(OK_COLOR)[$(APP)] Publish $(NAMESPACE)/$(image):$(IMAGE_VERSION)$(NO_COLOR)"
	@$(DOCKER) push $(NAMESPACE)/$(image):$(IMAGE_VERSION)

