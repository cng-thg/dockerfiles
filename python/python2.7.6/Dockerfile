#############################################################################
# Dockerfile to build python 2.7.6 image
# Based on yesops/ubuntu:14.04 image
#############################################################################


## Set the base image to Ubuntu
FROM yesops/ubuntu:14.04

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
RUN apt-get -qq update && apt-get install -y \
  python2.7=2.7.6-8 \
  python2.7-dev=2.7.6-8 \
  curl

## install "pip" from pypa or Ubuntu repository
RUN curl -SLk 'https://bootstrap.pypa.io/get-pip.py' | python2.7
