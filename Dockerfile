FROM hnc-base:latest
LABEL name="hnc-vps"
LABEL description="HashNet Container for enterprise VPS users"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

ARG USERNAME=user
ARG PASSWORD=password
ARG SSH_PORT=2222

# Install dependencies
RUN echo "Updating system ..." \
	&& apt-get update >/dev/null 2>&1 \
	&& echo "Installing dependencies ..." \
	&& apt-get install -y \
	bash-completion \
	iproute2 \
	git \
	openssh-server \
	inxi \
	htop

# Copy file system
COPY fs/ /

# Create user, set new user's password, configure sshd port, add user to sudo group.
RUN useradd --create-home --shell /bin/bash ${USERNAME} \
	&& echo "${USERNAME}:${PASSWORD}" | chpasswd \
	&& sed -i "s/Port 22/Port ${SSH_PORT}/g" /etc/ssh/sshd_config \
	&& usermod -aG sudo ${USERNAME}

# Make entrypoint executable
RUN chmod +x /srv/entrypoint.sh

# Set image starting point
CMD ["bash", "/srv/entrypoint.sh"]
