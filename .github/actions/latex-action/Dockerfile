# Container image that runs your code
FROM ubuntu:bionic

# Latex packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra && \
  rm -rf /var/lib/apt/lists/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

COPY . .

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]