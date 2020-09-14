#!/bin/bash

set -ex

DOCKER_DIR=$(realpath $(dirname $0))
ROOT_DIR=$(realpath $DOCKER_DIR/..)
# cd $DOCKER_DIR
cd $ROOT_DIR

function build_docker() {
    if [[ $# != 1 ]]; then 
        echo "build_docker should have param: docker tag."
        exit -1;
    fi
    DOCKER_TAG=$1
    DOCKER_FULL_TAG=platograph/plato-dev:$DOCKER_TAG
    docker build -t $DOCKER_FULL_TAG -f $DOCKER_DIR/Dockerfile .
    # pushd $ROOT_DIR
    docker run -e USER_NAME=$(id -un) -e USER_ID=$(id -u) -it $DOCKER_FULL_TAG
    # popd
}

if [[ x$1 != x ]]; then
    build_docker $1
else
    build_docker 0.0.1
fi
