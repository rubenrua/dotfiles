FROM ubuntu:14.04

MAINTAINER rubenrua

# Install packages: wget, git and emacs
RUN apt-get update && \
    apt-get install -y curl git emacs24-nox build-essential && \
        apt-get clean

# Create a workspace directory
RUN mkdir -p /workspace

ENTRYPOINT bash
