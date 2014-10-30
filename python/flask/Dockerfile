#############################################################################
# Dockerfile to build a Flask image
# Based on yesops/python2.7 image
#############################################################################


## Set the base image
FROM yesops/python:2.7

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Install Flask
RUN pip install flask flask-script

## Expose flask default port
EXPOSE 5000

## Working directory
WORKDIR /app

