.DEFAULT_GOAL := all

VERSION = latest
IMAGE = yesops/buildpack-deps

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
