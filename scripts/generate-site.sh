#!/bin/bash

# Using $TOP_LEVEL/DockerfileSite, generates static website files, saving to directory $TOP_LEVEL/static-site-files,
# where $TOP_LEVEL is the top level of the repo directory.

TOP_LEVEL=$(git rev-parse --show-toplevel)
docker build -t app-image:latest -f $TOP_LEVEL/DockerfileSite $TOP_LEVEL
DOCK_CONT=$(docker run -d app-image:latest)
docker cp $DOCK_CONT:/home/app/public $TOP_LEVEL/static-site-files
docker rm -f $DOCK_CONT
