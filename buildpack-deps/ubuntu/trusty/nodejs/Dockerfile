#############################################################################
# Dockerfile to build nodejs image
# Based on yesops/buildpack-deps:latest image
#############################################################################


## Set the base image yesops/buildpack-deps
FROM yesops/buildpack-deps:latest

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>


## Install enable Universe repository
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty universe" >> /etc/apt/sources.list

## Adding Nodesource repository
RUN curl -sL https://deb.nodesource.com/setup_dev | bash -

## Install nodejs
RUN apt-get install --no-install-recommends -y nodejs
