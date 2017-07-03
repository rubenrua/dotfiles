Script used to compile gstreamer in https://raw.githubusercontent.com/GStreamer/gstreamer/master/scripts/create-uninstalled-setup.sh


===========================================================================================

Done. Created new GStreamer uninstalled environment for branch 1.12 in /root/gst

To enter the uninstalled environment do: cd /root/gst; ./gst-1.12

To leave the uninstalled environment do: exit

To check the uninstalled environment do: printenv | grep GST
    (loads of output = you're in the uninstalled environment)

===========================================================================================

Now compile all GStreamer modules one by one by first switching into
the uninstalled environment and then doing:

    cd <MODULE>; ./autogen.sh; make

First gstreamer, then gst-plugins-base, then the other modules.
You do not need to do 'make install'

===========================================================================================

If your system GLib is too old, you can install a newer version
into --prefix=/root/gst/1.12/prefix and it should be picked up
by autogen.sh/configure


---


TODO

 - [ ] Add branch as env var in Makefile
 - [ ] See https://github.com/GStreamer/cerbero
 - [ ] See https://blogs.s-osg.org/setup-modern-gstreamer-development-environment-using-meson-gst-build/
