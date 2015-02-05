#############################################################################
# Dockerfile to build python 3.4.0 image
# Based on yesops/base image
#############################################################################


## Set the base image to Ubuntu
FROM yesops/ubuntu:14.04

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
RUN apt-get -qq update && apt-get install -y \
  python3.4=3.4.0-2ubuntu1 \
  python3.4-dev=3.4.0-2ubuntu1 \
  curl

## Make some useful symlinks that are expected to exist
RUN cd /usr/bin \
&& ln -s python3.4 python3 \
&& ln -s python3.4 python

## install "pip" from pypa
RUN curl -SLk 'https://bootstrap.pypa.io/get-pip.py' | python3.4
