rtp2() {
	# Works wit 1.8 but not with 1.9... The device doesn't report I420
	GSL v4l2src ! video/x-raw, format=I420,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}

