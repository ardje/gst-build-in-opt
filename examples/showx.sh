showx() {
	GSL v4l2src ! video/x-raw, framerate=25/1, width=1280, height=720 ! videoconvert ! ximagesink
}

