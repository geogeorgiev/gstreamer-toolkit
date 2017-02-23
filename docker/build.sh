#!/bin/bash 

echo "Starting the build process.\n"
echo "Checking if source files are available.\n"
[ ! -d sources ] && mkdir sources
cd sources
[ ! -d gstreamer ] && git clone git://anongit.freedesktop.org/git/gstreamer/gstreamer
[ ! -d gst-plugins-base ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-base
[ ! -d gst-plugins-good ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-good
[ ! -d gst-plugins-bad ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad
[ ! -d gst-plugins-ugly ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-ugly
[ ! -d gst-libav ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-libav
[ ! -d gst-omx ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-omx
[ ! -d gst-python ] && git clone git://anongit.freedesktop.org/git/gstreamer/gst-python
[ ! -d gstreamer-vaapi ] && git clone git://anongit.freedesktop.org/git/gstreamer/gstreamer-vaapi]

cd ..
DISTRO=${1:-ubuntu}
echo "Building the Docker container for ${DISTRO}."
docker build -t gooshan/gstreamer -f Dockerfile-${DISTRO} .