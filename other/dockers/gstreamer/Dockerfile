FROM ubuntu:17.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN sed -i "s/# deb-src /deb-src /" /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y emacs-nox git build-essential curl python3 python3-pip
RUN apt-get install -y ninja-build
RUN pip3 install meson
RUN apt-get build-dep -y gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
RUN apt-get build-dep -y gstreamer1.0-libav gstreamer1.0-vaapi
RUN apt-get install -y flex bison
RUN apt-get install -y autoconf autopoint

#RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/*

RUN echo /usr/local/lib/x86_64-linux-gnu >> /etc/ld.so.conf.d/libc-local.conf && ldconfig

RUN git clone git://anongit.freedesktop.org/gstreamer/gst-build /root/gst-build
RUN cd /root/gst-build && mkdir build/ && meson build && ninja -C build/  && ninja -C build/ install

