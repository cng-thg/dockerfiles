#############################################################################
# Dockerfile to build python3 image 
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>


## From Dockerfile docs, some instructions:

# RUN
#
# The RUN instruction will execute any commands in a new layer on top of the
# current image and commit the results. The resulting committed image will 
# be used for the next step in the Dockerfile.
# RUN has 2 forms:
#
#    RUN <command> (the command is run in a shell - /bin/sh -c)
#    RUN ["executable", "param1", "param2"] (exec form)

# EXPOSE
# 
# The EXPOSE instructions informs Docker that the container will listen on
# the specified network ports at runtime. Docker uses this information to
# interconnect containers using links.
#
# EXPOSE <port> [<port>...]

# ENV
#
# The ENV instruction sets the environment variable <key> to the value
# <value>. This value will be passed to all future RUN instructions.
# This is functionally equivalent to prefixing the command with <key>=<value>
#
# ENV <key> <value>


## Your settings go here:

## Update repos
RUN apt-get -qq update

## Install python-dev
RUN apt-get install -qqy python3-dev

## Install python-setuptools
RUN apt-get install -qqy python3-setuptools

## Install pip
RUN easy_install3 pip

## Install virtualenv
RUN pip install virtualenv
