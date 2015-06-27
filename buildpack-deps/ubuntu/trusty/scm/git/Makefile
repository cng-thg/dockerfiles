.DEFAULT_GOAL := all

VERSION = latest
IMAGE = yesops/git

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
