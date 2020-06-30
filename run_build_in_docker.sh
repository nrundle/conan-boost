#!/bin/bash

# First build the docker image from the local Dockerfile
docker build -t conan_boost docker/

# Now run the build using this image
docker run --rm -it -v $PWD:$PWD -w $PWD conan_boost bash -lc "./run_build.sh"
