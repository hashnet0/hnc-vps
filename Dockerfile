FROM hnc-base:latest
LABEL name="hnc-vps"
LABEL description="HashNet Container for enterprise VPS users"
LABEL maintainer="hashsploit <hashsploit@protonmail.com>"

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

# Expose service
EXPOSE 22

# Set image starting point
CMD ["/bin/bash"]
