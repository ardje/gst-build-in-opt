tsrtpvlc() { 
	cvlc --loop "$@" --sout '#rtp{mux=ts,caching=2000,dst='"${DMCAST}"',port='"${DPORT}"',sdp=sap://,name="meeh",dts-delay=1000}'
}

