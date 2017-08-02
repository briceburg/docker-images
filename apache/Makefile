CWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKERFILES := $(wildcard Dockerfile*)
PUBLISH := yes
PROJECT := apache

all: $(DOCKERFILES)
.PHONY: $(DOCKERFILES)

Dockerfile-xx.xx: PUBLISH = yes
$(DOCKERFILES):
	$(eval TAG = $(subst Dockerfile-,,$@))
	$(eval TAG = $(subst Dockerfile,latest,$(TAG)))
	cd $(CWD)
	docker build -t briceburg/$(PROJECT) -t briceburg/$(PROJECT):$(TAG) -f $@ .
	if [ "$(PUBLISH)" = "yes" ]; then docker push briceburg/$(PROJECT):$(TAG) ; fi
