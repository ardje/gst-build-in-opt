VER=1.9.90
PFX=/opt/gst/$VER
export PATH=$PFX/bin:$PATH
export LD_RUN_PATH=$LD_RUN_PATH:$PFX/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PFX/lib/pkgconfig
export GST_PLUGIN_PATH=$PFX/lib/gstreamer-1.0

