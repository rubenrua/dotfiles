FROM ubuntu:20.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Deps
RUN apt-get update
RUN apt-get install -y sudo emacs-nox git build-essential curl python3 python3-pip libssl-dev

# Rust
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN set -eux; \
    \
    # this "case" statement is generated via "update.sh"
    dpkgArch="$(dpkg --print-architecture)"; \
    case "${dpkgArch##*-}" in \
         amd64) rustArch='x86_64-unknown-linux-gnu'; rustupSha256='5a38dbaf7ab2e4335a3dfc42698a5b15e7167c93b0b06fc95f53c1da6379bf1a' ;; \
         armhf) rustArch='armv7-unknown-linux-gnueabihf'; rustupSha256='f7ffec8a9cfe3096d535576e79cbd501766fda3769e9ed755cf1f18d7a3ba49c' ;; \
         arm64) rustArch='aarch64-unknown-linux-gnu'; rustupSha256='bc513fbd0d221166d3aa612907016d417f8642448d1727c1446876ec9326ab2c' ;; \
         i386) rustArch='i686-unknown-linux-gnu'; rustupSha256='82b7ca05ce20e7b8f8dff4a406ef3610d21feb1476fa6fd8959355ac11474ce5' ;; \
         *) echo >&2 "unsupported architecture: ${dpkgArch}"; exit 1 ;; \
    esac; \
    \
    url="https://static.rust-lang.org/rustup/archive/1.7.0/${rustArch}/rustup-init"; \
    curl -O "$url"; \
    echo "${rustupSha256} *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path ; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;

# GStreamer
RUN apt-get install -y \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
    gstreamer1.0-alsa  gstreamer1.0-plugins-base-apps gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-libav gstreamer1.0-nice \
    gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers  gstreamer1.0-vaapi gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 gir1.2-gst-plugins-bad-1.0

RUN apt-get install -y \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-good1.0-dev  libgstreamer-plugins-bad1.0-dev

# Other
RUN apt-get install -y libgtk-3-dev

# X - Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "render:x:133:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    echo "developer:developer" | chpasswd && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer&& \
    usermod -a -G root developer && \
    usermod -a -G video developer && \
    usermod -a -G render developer

USER developer
ENV HOME /home/developer

RUN mkdir /home/developer/src && cd /home/developer/src; \
    git clone https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git ; \
    git clone https://gitlab.freedesktop.org/gstreamer/gstreamer-rs.git ; \
    cargo install cargo-c
