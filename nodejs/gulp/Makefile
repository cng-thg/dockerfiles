.DEFAULT_GOAL := all

VERSION = latest
IMAGE = yesops/gulpjs

all: build

build:
	docker build -t $(IMAGE):$(VERSION) .
