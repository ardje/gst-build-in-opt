tsrtpfile() {
	GSL filesrc location="$1" ! qtdemux name=demuxed \
		mpegtsmux name=tsmux \
		queue name=quadio \
		queue name=qvideo \
		demuxed.audio_00 ! qaudio. ! tsmux. \
		demuxed.video_00 ! qvideo. ! tsmux. \
		tsmux. ! rtpmp2tpay !  udpsink host=$DMCAST port=$DPORT auto-multicast=true
}

