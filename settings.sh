#!/bin/bash

# Docker image name
IMAGE_NAME="hnc-vps:latest"

# The container's name when using ./run.sh
CONTAINER_NAME="hnc-vps"

HOSTNAME=""

# The maximum memory allowed in this container
MEMORY_MAX="512m"

# The Docker's external ssh port
SSH_PORT="22820"

# The mounted volume name when using ./run.sh
VOLUME_NAME=${CONTAINER_NAME}
