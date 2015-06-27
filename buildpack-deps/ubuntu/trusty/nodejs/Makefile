.DEFAULT_GOAL := all

VERSION = latest
IMAGE = yesops/nodejs-buildpack

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
