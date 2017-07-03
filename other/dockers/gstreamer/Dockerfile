FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y emacs24-nox git build-essential curl python3 python3-pip && \
    apt-get install -y ninja-build && \
    apt-get install -y flex bison && \
    apt-get install -y libglib2.0-dev liborc-0.4-dev && \
    apt-get install -y libgtk-3-dev && \
    pip3 install meson && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#    apt-get install -y autoconf autopoint && \


ADD https://raw.githubusercontent.com/GStreamer/gstreamer/master/scripts/create-uninstalled-setup.sh /create-uninstalled-setup.sh

RUN echo /usr/local/lib/x86_64-linux-gnu >> /etc/ld.so.conf.d/libc-local.conf && ldconfig

ENV GST_BRANCH 1.12

RUN sed -i s/BRANCH=\"master\"/BRANCH=\"${GST_BRANCH}\"/g /create-uninstalled-setup.sh
RUN chmod +x /create-uninstalled-setup.sh && /create-uninstalled-setup.sh
RUN /root/gst/gst-${GST_BRANCH}
RUN mkdir /root/gst/${GST_BRANCH}/gstreamer/build && cd /root/gst/${GST_BRANCH}/gstreamer/build && meson ../ && ninja && ninja install && ldconfig
RUN mkdir /root/gst/${GST_BRANCH}/gst-plugins-base/build && cd /root/gst/${GST_BRANCH}/gst-plugins-base/build && meson ../ && ninja && ninja install && ldconfig
RUN mkdir /root/gst/${GST_BRANCH}/gst-plugins-good/build && cd /root/gst/${GST_BRANCH}/gst-plugins-good/build && meson ../ && ninja && ninja install && ldconfig
RUN mkdir /root/gst/${GST_BRANCH}/gst-plugins-ugly/build && cd /root/gst/${GST_BRANCH}/gst-plugins-ugly/build && meson ../ && ninja && ninja install && ldconfig
RUN mkdir /root/gst/${GST_BRANCH}/gst-plugins-bad/build && cd /root/gst/${GST_BRANCH}/gst-plugins-bad/build && meson ../ && ninja && ninja install && ldconfig
RUN mkdir /root/gst/${GST_BRANCH}/gst-libav/build && cd /root/gst/${GST_BRANCH}/gst-libav/build && meson ../ && ninja && ninja install && ldconfig
