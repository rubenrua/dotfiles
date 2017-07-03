#!/bin/bash

cd ~/pipewire/build/
ninja
ninja install
ldconfig
service dbus start
pipewire &

##
##
## gst-inspect-1.0  --gst-plugin-path=/usr/local/lib/x86_64-linux-gnu/gstreamer-1.0/  pipewiresrc
## gst-launch-1.0 -v v4l2src device=/dev/video0 ! video/x-raw, width=800, height=600 ! autovideosink
## gst-launch-1.0  --gst-plugin-path=/usr/local/lib/x86_64-linux-gnu/gstreamer-1.0/  pipewiresrc path=12 ! video/x-raw, width=800, height=600 ! autovideosink
##
