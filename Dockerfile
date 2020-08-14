FROM hnc-base:latest
LABEL name="hnc-vps"
LABEL description="HashNet Container for enterprise VPS users"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

ARG PASSWORD=password

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

# Set password
RUN echo "root:${PASSWORD}" | chpasswd

# Make entrypoint executable
RUN chmod +x /srv/entrypoint.sh

# Expose service
EXPOSE 22

# Set image starting point
CMD ["bash", "/srv/entrypoint.sh"]
