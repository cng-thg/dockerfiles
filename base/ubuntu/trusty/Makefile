.DEFAULT_GOAL := all

VERSION = trusty
IMAGE = yesops/ubuntu

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
