#############################################################################
# Dockerfile to build a Git image
# Based on yesops/build-dep image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/build-deps

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
  curl \
  git
