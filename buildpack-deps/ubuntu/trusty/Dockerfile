#############################################################################
# Dockerfile to build an image with common build dependencies used 
# for installing various modules, e.g., eggs, gems, npm modules.
# Based on yesops/git:latest                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/git:latest

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Enable universe repository
# RUN echo "deb http://archive.ubuntu.com/ubuntu trusty universe" >> /etc/apt/sources.list.d/universe.list

## Update repos and install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    build-essential \
    imagemagick \
    libbz2-dev \
    libcurl4-openssl-dev \
    libevent-dev \
    libffi-dev \
    libglib2.0-dev \
    libjpeg-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmysqlclient-dev \
    libncurses-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    zlib1g-dev
