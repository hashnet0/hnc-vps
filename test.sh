#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker run --rm -i -t \
	-h ${HOSTNAME} \
	-e CONTAINER_NAME=${CONTAINER_NAME} \
	--cpus=${CPUS} \
	--memory=${MEMORY_MAX} \
	--memory-swap=${MEMORY_MAX} \
	--memory-swappiness="0" \
	${IMAGE_NAME} bash

