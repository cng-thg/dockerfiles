
# Dockerfiles


All Dockerfiles used at YesOps.

## Contain these images:

* Base: docker/ubuntu + tweaks
* Build-deps: base + build-deps
* Git: build-deps + git + curl
* Python 2.7: git + python2.7 + python2.7-dev + pip + virtualenv
* Python 3.4: git + python3.4 + python3.4-dev + pip + virtualenv
* Postgres: base + postegresql-9.3

## Features

* Free software: BSD license
