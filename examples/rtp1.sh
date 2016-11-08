rtp1() {
	GSLv v4l2src ! video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5000
}
