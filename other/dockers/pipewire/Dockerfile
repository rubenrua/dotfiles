FROM debian

RUN apt-get update && \
    apt-get install -y emacs24-nox git build-essential curl python3 python3-pip && \
    apt-get install -y build-essential meson pkg-config && \
    apt-get install -y libgtk2.0-dev libdbus-glib-1-dev && \
    apt-get install -y gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-alsa gstreamer1.0-pulseaudio libgstreamer1.0-0 gstreamer1.0-tools && \
    apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev && \
    apt-get install -y libasound2-dev libv4l-dev libsdl2-dev libavcodec-dev libavformat-dev libavfilter-dev libva-dev

COPY x86_64-libc.conf /etc/ld.so.conf.d/x86_64-libc.conf


RUN ldconfig

RUN cd && \
    git clone https://github.com/wtay/pipewire.git && \
    cd pipewire && \
    ./autogen.sh

COPY entrypoint.sh /entrypoint.sh
