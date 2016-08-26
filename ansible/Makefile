CWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKERFILES := $(wildcard Dockerfile*)
PUBLISH := no
PROJECT := ansible

all: $(DOCKERFILES)
.PHONY: $(DOCKERFILES)

Dockerfile-2.1: PUBLISH = yes
$(DOCKERFILES):
	$(eval TAG = $(subst Dockerfile-,,$@))
	$(eval TAG = $(subst Dockerfile,latest,$(TAG)))
	cd $(CWD)
	docker build -t briceburg/$(PROJECT) -t briceburg/$(PROJECT):$(TAG) -f $@ .
