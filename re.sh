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

if [ -e "examples/$CMD.sh" ]; then
  . "examples/$CMD.sh"
  $CMD "$@"
else
  echo example not found
fi
