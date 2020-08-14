#!/bin/bash

# Docker image name
IMAGE_NAME="hnc-vps:latest"

# The container's name when using ./deploy.sh and ./test.sh
CONTAINER_NAME="hnc-vps"

# Hostname of the server
HOSTNAME="hnc-vps"

# Password for root user
PASSWORD="root"

# Number of CPU's allowed to be used in this container
CPUS="8"

# The maximum memory allowed in this container
MEMORY_MAX="512m"

# The Docker's external ssh port
SSH_PORT="22820"

# The mounted volume name when using ./deploy.sh
VOLUME_NAME=${CONTAINER_NAME}
