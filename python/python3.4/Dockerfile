#############################################################################
# Dockerfile to build python 3.4 image 
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/git

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
                                python3 \
                                python3-dev \
                                python3-doc

## install "pip" from pypa
RUN curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python

## Install virtualenv
RUN pip install virtualenv

## Make some useful symlinks that are expected to exist
RUN cd /usr/bin \
&& ln -s pydoc3 pydoc \
&& ln -s python3 python
