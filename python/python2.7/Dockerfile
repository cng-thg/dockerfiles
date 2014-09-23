#############################################################################
# Dockerfile to build python 2.7 image 
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/vcs

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
                                python \
                                python-dev \
                                python-doc

## install "pip" from pypa
RUN curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python

## Install virtualenv
RUN pip install virtualenv
