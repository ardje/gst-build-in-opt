#!/bin/bash -x
. ./set_env.sh
CMD="$1"

export export GST_DEBUG_DUMP_DOT_DIR=$PWD/tmp/
mkdir tmp
rm tmp/*

DMCAST=239.255.12.42
DPORT=5004
GSL(){
	gst-launch-1.0 -v "$@"
}

# The AVIO has 2 formats:
FORMAT=NV12
FORMAT=YUY2
# X264 formats: I420, YV12, Y42B, Y444, NV12, I420_10LE, I422_10LE, Y444_10LE

showx() {
	GSL v4l2src ! video/x-raw, framerate=25/1, width=1280, height=720 ! videoconvert ! ximagesink
}
rtp1() {
	GSL -v v4l2src ! video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}
rtp2() {
	GSL -v v4l2src ! video/x-raw, format=I420,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}
rtp() {
	GSL v4l2src !  video/x-raw, format=$FORMAT,framerate=25/1,width=1280,height=720 ! videoconvert !  x264enc ! h264parse ! rtph264pay config-interval=10 !  udpsink host=$DMCAST port=$DPORT
}
probe() {
	gst-device-monitor-1.0 Video/Source
}


$CMD
