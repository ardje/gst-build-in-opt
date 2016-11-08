run() {

#       GSL v4l2src ! video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! videoconvert ! queue ! x264enc speed-preset=1 ! h264parse ! mpegtsmux ! rtpmp2tpay '!' udpsink host=239.255.12.42 port=5004 auto-multicast=true
        GSL v4l2src do-timestamp=true ! video/x-raw, format=$FORMAT,framerate=25/1, width=1280, height=720 ! queue max-size-bytes=335544320 min-threshold-time=10000000 ! videoconvert ! queue ! x264enc speed-preset=3  ! h264parse ! mpegtsmux ! queue ! rtpmp2tpay '!' udpsink host=239.255.12.42 port=5004 auto-multicast=true sync=true
}
run "$@"
