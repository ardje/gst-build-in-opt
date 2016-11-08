tsrtp() {
	GSL v4l2src !  video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! videoconvert !  x264enc ! mpegtsmux ! rtpmp2tpay !  udpsink host=$DMCAST port=$DPORT auto-multicast=true
}

