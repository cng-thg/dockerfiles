#############################################################################
# Dockerfile to build nodejs image
# Based on yesops/git image
#############################################################################


## Set the base image yesops/git
FROM yesops/nodejs

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Install Cloud9
RUN git clone https://github.com/ajaxorg/cloud9.git && \
    cd cloud9 && \
    npm install

## Export C9 port
EXPOSE 3131

## Working dir
WORKDIR /cloud9

## Run C9
CMD bin/cloud9.sh -l 0.0.0.0 -w ${FOLDER:-"/code"} 
