#############################################################################
# Dockerfile to build an image with Git SCM
# Based on yesops/ubuntu:latest                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/ubuntu:latest

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    wget \
    git
