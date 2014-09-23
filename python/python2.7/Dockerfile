#############################################################################
# Dockerfile to build python 2.7 image 
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/git

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  python \
  python-dev \
  python-doc

## install "pip" from pypa
RUN curl -SLk 'https://bootstrap.pypa.io/get-pip.py' | python

## Install virtualenv
RUN pip install virtualenv
