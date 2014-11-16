FROM ubuntu:14.04

MAINTAINER rubenrua

# Install packages: wget, git, mercurial and emacs
RUN apt-get update && \
    apt-get install -y curl git emacs24-nox build-essential && \
        apt-get clean

# Create a Go workspace directory
RUN mkdir -p /workspace

ENTRYPOINT bash
