rtp() {
	GSL v4l2src !  video/x-raw, format=$FORMAT,framerate=25/1,width=1280,height=720 ! videoconvert !  x264enc ! h264parse ! rtph264pay config-interval=10 !  udpsink host=$DMCAST port=$DPORT auto-multicast=true
}


