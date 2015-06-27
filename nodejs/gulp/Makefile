.DEFAULT_GOAL := all

VERSION = latest
IMAGE = yesops/gulp

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
