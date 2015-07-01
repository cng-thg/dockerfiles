.DEFAULT_GOAL := all

VERSION = wily
IMAGE = yesops/ubuntu

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
