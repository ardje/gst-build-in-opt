#!/bin/bash -x
. ./set_env.sh
CMD="$1";shift

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
	GSLv v4l2src ! video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}
rtp2() {
	# Works wit 1.8 but not with 1.9... The device doesn't report I420
	GSL v4l2src ! video/x-raw, format=I420,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}
rtp() {
	GSL v4l2src !  video/x-raw, format=$FORMAT,framerate=25/1,width=1280,height=720 ! videoconvert !  x264enc ! h264parse ! rtph264pay config-interval=10 !  udpsink host=$DMCAST port=$DPORT auto-multicast=true
}
tsrtp() {
	GSL v4l2src !  video/x-raw, format=$FORMAT,framerate=25/1,width=1280,height=720 ! videoconvert !  x264enc ! mpegtsmux ! rtpmp2tpay !  udpsink host=$DMCAST port=$DPORT auto-multicast=true
}
# example for working tsrtp of mp4 encoded files
tsrtpvlc() { 
	cvlc --loop "$@" --sout '#rtp{mux=ts,caching=2000,dst='"${DMCAST}"',port='"${DPORT}"',sdp=sap://,name="meeh",dts-delay=1000}'
}
rtpplay() {
	# Does not work with this build, works with standard gstreamer
	GSL playbin uri=udp://${DMCAST}:${DPORT} video-sink=cluttersink flags=0x00000253
}
probe() {
	gst-device-monitor-1.0 Video/Source
}


$CMD "$@"
