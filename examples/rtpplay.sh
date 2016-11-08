rtpplay() {
	# Does not work with this build, works with standard gstreamer
	GSL playbin uri=udp://${DMCAST}:${DPORT} video-sink=cluttersink flags=0x00000253
}
