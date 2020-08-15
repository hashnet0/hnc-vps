#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker rmi ${IMAGE_NAME}
docker build \
	--build-arg USERNAME=${USERNAME} \
	--build-arg PASSWORD=${PASSWORD} \
	--build-arg SSH_PORT=${SSH_PORT} \
	--force-rm \
	--rm \
	--tag ${IMAGE_NAME} .

