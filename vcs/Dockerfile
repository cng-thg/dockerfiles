#############################################################################
# Dockerfile to build an image with essential build packages
# Based on yesops/build-dep image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
