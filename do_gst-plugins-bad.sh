#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd gst-plugins-bad
git clean -x -d -f
git checkout 1.9.90
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes
$( awk '/^[^#]/ { print $1 }' <<EOF
# 
# 'configure' configures GStreamer Bad Plug-ins 1.9.90 to adapt to many kinds of systems.
# 
# Usage: ./configure [OPTION]... [VAR=VALUE]...
# 
# To assign environment variables (e.g., CC, CFLAGS...), specify them as
# VAR=VALUE.  See below for descriptions of some of the useful variables.
# 
# Defaults for the options are specified in brackets.
# 
# Configuration:
#   -h, --help              display this help and exit
#       --help=short        display options specific to this package
#       --help=recursive    display the short help of all the included packages
#   -V, --version           display version information and exit
#   -q, --quiet, --silent   do not print 'checking ...' messages
#       --cache-file=FILE   cache test results in FILE [disabled]
#   -C, --config-cache      alias for '--cache-file=config.cache'
#   -n, --no-create         do not create output files
#       --srcdir=DIR        find the sources in DIR [configure dir or '..']
# 
# Installation directories:
#   --prefix=PREFIX         install architecture-independent files in PREFIX
#                           [/usr/local]
#   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#                           [PREFIX]
# 
# By default, 'make install' will install all the files in
# '/usr/local/bin', '/usr/local/lib' etc.  You can specify
# an installation prefix other than '/usr/local' using '--prefix',
# for instance '--prefix=$HOME'.
# 
# For better control, use the options below.
# 
# Fine tuning of the installation directories:
#   --bindir=DIR            user executables [EPREFIX/bin]
#   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#   --libexecdir=DIR        program executables [EPREFIX/libexec]
#   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#   --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
#   --libdir=DIR            object code libraries [EPREFIX/lib]
#   --includedir=DIR        C header files [PREFIX/include]
#   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#   --infodir=DIR           info documentation [DATAROOTDIR/info]
#   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#   --mandir=DIR            man documentation [DATAROOTDIR/man]
#   --docdir=DIR            documentation root [DATAROOTDIR/doc/gst-plugins-bad]
#   --htmldir=DIR           html documentation [DOCDIR]
#   --dvidir=DIR            dvi documentation [DOCDIR]
#   --pdfdir=DIR            pdf documentation [DOCDIR]
#   --psdir=DIR             ps documentation [DOCDIR]
# 
# Program names:
#   --program-prefix=PREFIX            prepend PREFIX to installed program names
#   --program-suffix=SUFFIX            append SUFFIX to installed program names
#   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
# 
# System types:
#   --build=BUILD     configure for building on BUILD [guessed]
#   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#   --target=TARGET   configure for building compilers for TARGET [HOST]
# 
# Optional Features:
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --enable-silent-rules   less verbose build output (undo: "make V=1")
#   --disable-silent-rules  verbose build output (undo: "make V=0")
#   --disable-maintainer-mode
#                           disable make rules and dependencies not useful (and
#                           sometimes confusing) to the casual installer
#   --enable-static[=PKGS]  build static libraries [default=no]
#   --enable-shared[=PKGS]  build shared libraries [default=yes]
#   --enable-fast-install[=PKGS]
#                           optimize for fast installation [default=yes]
#   --enable-dependency-tracking
#                           do not reject slow dependency extractors
#   --disable-dependency-tracking
#                           speeds up one-time build
#   --disable-libtool-lock  avoid locking (might break parallel builds)
#   --disable-nls           do not use Native Language Support
#   --disable-rpath         do not hardcode runtime library paths
#   --disable-fatal-warnings
#                           Don't turn compiler warnings into fatal errors
#   --enable-extra-checks   Enable extra runtime checks
#   --disable-debug         disable addition of -g debugging info
#   --enable-profiling      adds -pg to compiler commandline, for profiling
#   --disable-valgrind      disable run-time valgrind detection
#   --enable-gcov           compile with coverage profiling instrumentation (gcc
#                           only)
#   --disable-examples      disable building examples
#   --disable-external           disable building of plug-ins with external deps
#   --enable-experimental        enable building of experimental plug-ins
#   --enable-introspection=[no/auto/yes]
#                           Enable introspection for this build
#   --enable-gtk-doc        use gtk-doc to build documentation [[default=no]]
   --disable-gtk-doc        use gtk-doc to build documentation [[default=no]]
#   --enable-gtk-doc-html   build documentation in html format [[default=yes]]
   --disable-gtk-doc-html   build documentation in html format [[default=yes]]
#   --enable-gtk-doc-pdf    build documentation in pdf format [[default=no]]
   --disable-gtk-doc-pdf    build documentation in pdf format [[default=no]]
#   --enable-gobject-cast-checks=[no/auto/yes]
#                           Enable GObject cast checks
#   --enable-glib-asserts=[no/yes]
#                           Enable GLib assertion
#   --disable-Bsymbolic     avoid linking with -Bsymbolic
  --enable-orc            use Orc if installed
#   --enable-static-plugins build static plugins [default=no]
#  --disable-accurip       disable dependency-less accurip plugin
#  --disable-adpcmdec      disable dependency-less adpcmdec plugin
#  --disable-adpcmenc      disable dependency-less adpcmenc plugin
#  --disable-aiff          disable dependency-less aiff plugin
#  --disable-videoframe_audiolevel
#                          disable dependency-less videoframe_audiolevel plugin
#  --disable-asfmux        disable dependency-less asfmux plugin
#  --disable-audiofxbad    disable dependency-less audiofxbad plugin
#  --disable-audiomixer    disable dependency-less audiomixer plugin
#  --disable-compositor    disable dependency-less compositor plugin
  --disable-audiovisualizers
#                          disable dependency-less audiovisualizers plugin
#  --disable-autoconvert   disable dependency-less autoconvert plugin
#  --disable-bayer         disable dependency-less bayer plugin
#  --disable-camerabin2    disable dependency-less camerabin2 plugin
#  --disable-cdxaparse     disable dependency-less cdxaparse plugin
#  --disable-coloreffects  disable dependency-less coloreffects plugin
#  --disable-dataurisrc    disable dependency-less dataurisrc plugin
#  --disable-dccp          disable dependency-less dccp plugin
#  --disable-debugutils    disable dependency-less debugutils plugin
  --disable-dvbsuboverlay disable dependency-less dvbsuboverlay plugin
#  --disable-dvdspu        disable dependency-less dvdspu plugin
  --disable-faceoverlay   disable dependency-less faceoverlay plugin
#  --disable-festival      disable dependency-less festival plugin
#  --disable-fieldanalysis disable dependency-less fieldanalysis plugin
#  --disable-freeverb      disable dependency-less freeverb plugin
#  --disable-frei0r        disable dependency-less frei0r plugin
#  --disable-gaudieffects  disable dependency-less gaudieffects plugin
#  --disable-geometrictransform
#                          disable dependency-less geometrictransform plugin
#  --disable-gdp           disable dependency-less gdp plugin
#  --disable-hdvparse      disable dependency-less hdvparse plugin
#  --disable-id3tag        disable dependency-less id3tag plugin
#  --disable-inter         disable dependency-less inter plugin
#  --disable-interlace     disable dependency-less interlace plugin
#  --disable-ivfparse      disable dependency-less ivfparse plugin
#  --disable-ivtc          disable dependency-less ivtc plugin
#  --disable-jp2kdecimator disable dependency-less jp2kdecimator plugin
#  --disable-jpegformat    disable dependency-less jpegformat plugin
#  --disable-librfb        disable dependency-less librfb plugin
#  --disable-midi          disable dependency-less midi plugin
#  --disable-mpegdemux     disable dependency-less mpegdemux plugin
#  --disable-mpegtsdemux   disable dependency-less mpegtsdemux plugin
#  --disable-mpegtsmux     disable dependency-less mpegtsmux plugin
#  --disable-mpegpsmux     disable dependency-less mpegpsmux plugin
#  --disable-mve           disable dependency-less mve plugin
#  --disable-mxf           disable dependency-less mxf plugin
#  --disable-netsim        disable dependency-less netsim plugin
#  --disable-nuvdemux      disable dependency-less nuvdemux plugin
#  --disable-onvif         disable dependency-less onvif plugin
#  --disable-patchdetect   disable dependency-less patchdetect plugin
#  --disable-pcapparse     disable dependency-less pcapparse plugin
#  --disable-pnm           disable dependency-less pnm plugin
#  --disable-rawparse      disable dependency-less rawparse plugin
#  --disable-removesilence disable dependency-less removesilence plugin
#  --disable-sdi           disable dependency-less sdi plugin
#  --disable-sdp           disable dependency-less sdp plugin
#  --disable-segmentclip   disable dependency-less segmentclip plugin
#  --disable-siren         disable dependency-less siren plugin
#  --disable-smooth        disable dependency-less smooth plugin
#  --disable-speed         disable dependency-less speed plugin
#  --disable-subenc        disable dependency-less subenc plugin
#  --disable-stereo        disable dependency-less stereo plugin
#  --disable-timecode      disable dependency-less timecode plugin
#  --disable-tta           disable dependency-less tta plugin
#  --disable-videofilters  disable dependency-less videofilters plugin
#  --disable-videomeasure  disable dependency-less videomeasure plugin
#  --disable-videoparsers  disable dependency-less videoparsers plugin
#  --disable-videosignal   disable dependency-less videosignal plugin
#  --disable-vmnc          disable dependency-less vmnc plugin
#  --disable-y4m           disable dependency-less y4m plugin
#  --disable-yadif         disable dependency-less yadif plugin
#  --enable-opengl         Enable Desktop OpenGL support [default=auto]
  --disable-opengl         Enable Desktop OpenGL support [default=auto]
#  --enable-gles2          Enable OpenGL|ES 2.0 support [default=auto]
  --disable-gles2          Enable OpenGL|ES 2.0 support [default=auto]
#  --enable-egl            Enable EGL support [default=auto]
  --disable-egl            Enable EGL support [default=auto]
#  --enable-wgl            Enable WGL support [default=auto]
  --disable-wgl            Enable WGL support [default=auto]
#  --enable-glx            Enable GLX support [default=auto]
  --disable-glx            Enable GLX support [default=auto]
#  --enable-cocoa          Enable Cocoa support [default=auto]
  --disable-cocoa          Enable Cocoa support [default=auto]
#  --enable-x11            Enable x11 support [default=auto]
  --disable-x11            Enable x11 support [default=auto]
#  --enable-wayland        Enable Wayland support (requires EGL) [default=auto]
  --disable-wayland        Enable Wayland support (requires EGL) [default=auto]
#  --enable-dispmanx        Enable Dispmanx support (requires EGL) [default=auto]
  --disable-directsound        disable DirectSound: directsoundsrc
  --disable-wasapi             disable WASAPI plug-in: wasapi
  --disable-direct3d           disable Direct3D plug-in: direct3dsink
  --disable-winscreencap       disable winscreencap plug-in: winscreencap
  --disable-winks              disable Winks plug-in: winks
  --disable-android_media      disable Android Media: androidmedia
  --disable-apple_media        disable Apple video: applemedia
  --disable-bluez              disable Bluez: bluez
  --disable-avc                disable AVC Video Services: avcsrc
  --disable-shm                disable POSIX shared memory source and sink: shm
  --disable-vcd                disable Video CD: vcdsrc
  --disable-opensles           disable OpenSL ES: opensl
  --disable-uvch264            disable UVC H264: uvch264
  --disable-nvenc              disable NVIDIA Encode API: nvenc
  --disable-tinyalsa           disable tinyalsa: tinyalsa
  --disable-assrender          disable ASS/SSA renderer: assrender
  --disable-voamrwbenc         disable vo-amrwbenc library: vo-amrwbenc
  --disable-voaacenc           disable vo-aacenc library: vo-aacenc
  --disable-apexsink           disable AirPort Express Wireless sink: apexsink
  --disable-bs2b               disable bs2b: bs2b
  --disable-bz2                disable bz2 library: bz2
  --disable-chromaprint        disable chromaprint: chromaprint
  --disable-curl               disable Curl plugin: curl
  --disable-dash               disable DASH plug-in: dash
  --disable-dc1394             disable libdc1394: dc1394
  --disable-decklink           disable decklink: decklink
  --disable-directfb           disable directfb: dfbvideosink
  --disable-wayland            disable wayland sink: wayland
  --disable-webp               disable WebP: webp
  --disable-daala              disable daala: daala
  --disable-dts                disable dts library: dtsdec
  --disable-resindvd           disable resindvd plugin: resindvd
  --disable-faac               disable AAC encoder plug-in: faac
  --disable-faad               disable FAAD2 AAC decoder plug-in: faad
  --disable-fbdev              disable linux framebuffer: fbdevsink
  --disable-fdk_aac            disable fdkaac plugin: fdkaac
  --disable-flite              disable Flite plugin: flite
  --disable-gsm                disable GSM library: gsmenc gsmdec
  --disable-fluidsynth         disable fluidsynth: fluidsynth
  --disable-kate               disable Kate: kate
  --disable-kms                disable drm/kms libraries: kms
  --disable-ladspa             disable ladspa: ladspa
  --disable-lv2                disable lv2: lv2
  --disable-libde265           disable libde265 HEVC/H.265 decoder: libde265
  --disable-libmms             disable mms protocol library: libmms
  --disable-srtp               disable srtp library: srtp
  --disable-dtls               disable DTLS plugin: dtls
  --disable-linsys             disable Linear Systems SDI plugin: linsys
  --disable-modplug            disable modplug: modplug
  --disable-mimic              disable libmimic library: mimic
  --disable-mpeg2enc           disable mpeg2enc: mpeg2enc
  --disable-mplex              disable mplex: mplex
  --disable-musepack           disable musepackdec: musepack
  --disable-nas                disable nas plug-in: nassink
  --disable-neon               disable neon http client plugins: neonhttpsrc
  --disable-ofa                disable ofa plugins: ofa
  --disable-openal             disable OpenAL plugin: openal
  --disable-opencv             disable opencv plugins: opencv
  --disable-openexr            disable openexr library: openexr
  --disable-openh264           disable openh264 library: openh264
  --disable-openjpeg           disable openjpeg library: openjpeg
  --disable-openni2            disable openni2 library: openni2
  --disable-opus               disable opus: opus
  --disable-pvr                disable pvrvideosink: pvr
  --disable-rsvg               disable rsvg decoder: rsvg
  --disable-gl                 disable gl elements: gl
  --disable-gtk3               disable Gtk+ elements: gtk
  --disable-qt                 disable Qt elements: qt
  --disable-vulkan             disable Vulkan elements: vulkan
  --disable-libvisual          disable libvisual visualization library: libvisual
  --disable-timidity           disable timidity midi soft synth plugin: timidity
  --disable-teletextdec        disable Teletext decoder: teletextdec
  --disable-wildmidi           disable wildmidi midi soft synth plugin: wildmidi
  --disable-sdl                disable SDL plug-in: sdlvideosink sdlaudiosink
  --disable-sdltest       do not try to compile and run a test SDL program
  --disable-smoothstreaming    disable Smooth Streaming plug-in: smoothstreaming
  --disable-sndfile            disable sndfile plug-in: sfdec sfenc
  --disable-soundtouch         disable soundtouch plug-in: soundtouch
  --disable-spc                disable spc decoder: spc
  --disable-gme                disable gme decoder: gme
  --disable-xvid               disable xvid plugins: xvid
  --disable-dvb                disable DVB Source: dvb
  --disable-wininet            disable Windows internet library: wininet
  --disable-acm                disable Windows ACM library: acm
  --disable-vdpau              disable VDPAU: vdpau
  --disable-sbc                disable SBC bluetooth audio codec: sbc
  --disable-schro              disable Schroedinger video codec: schro
  --disable-zbar               disable ZBar barcode detector: zbar
  --disable-rtmp               disable rtmp library: rtmp
  --disable-spandsp            disable Spandsp: spandsp
  --disable-sndio              disable sndio audio: sndio
  --disable-hls                disable http live streaming plugin: hls
  --disable-x265               disable x265 plug-in: x265
  --disable-webrtcdsp          disable WebRTC Audio Processing: webrtcdsp
# 
# Optional Packages:
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
#                           both]
#   --with-aix-soname=aix|svr4|both
#                           shared library versioning (aka "SONAME") variant to
#                           provide on AIX, [default=aix].
#   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#   --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
#                           compiler's sysroot if not specified).
#   --with-autoconf         use a different autoconf for regeneration of
#                           Makefiles
#   --with-autoheader       use a different autoheader for regeneration of
#                           Makefiles
#   --with-automake         use a different automake for regeneration of
#                           Makefiles
#   --with-aclocal          use a different aclocal for regeneration of
#                           Makefiles
#   --with-gnu-ld           assume the C compiler uses GNU ld default=no
#   --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
#   --without-libiconv-prefix     don't search for libiconv in includedir and libdir
#   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
#   --without-libintl-prefix     don't search for libintl in includedir and libdir
#   --with-pkg-config-path  colon-separated list of pkg-config(1) dirs
#   --with-package-name     specify package name to use in plugins
#   --with-package-origin   specify package origin URL to use in plugins
#   --with-plugins          comma-separated list of dependencyless plug-ins to
#                           compile
#   --with-html-dir=PATH    path to installed docs
#   --with-gtk=3.0|2.0      which gtk+ version to compile against (default: 2.0)
#   --with-player-tests     Enable GstPlayer tests that need network access
#                           (default: no)
#   --with-default-audiosink
#                           specify default audio sink
#   --with-default-audiosrc specify default audio source
#   --with-default-videosink
#                           specify default video sink
#   --with-default-videosrc specify default video source
#   --with-default-visualizer
#                           specify default visualizer
#   --with-opengl-module-name
#                           library module name for OpenGL (default: libGL)
#   --with-gles2-module-name
#                           library module name for GLES2 (default: libGLESv2)
#   --with-egl-module-name  library module name for EGL (default: libEGL)
#   --with-jpeg-mmx, path to MMX'ified JPEG library
#   --with-cuda-prefix      Use the provided prefix for detecting the cuda
#                           installation
#   --with-pvr-external-headers
#                           Use system installed PVR2D headers
#   --with-sdl-prefix=PFX   prefix where SDL is installed (optional)
#   --with-sdl-exec-prefix=PFX
#                           exec prefix where SDL is installed (optional)
#   --with-hls-crypto=auto|nettle|libgcrypt|openssl
#                           which cryptographic library version to compile
#                           against for hls (default: auto)
#   --with-libgcrypt-prefix=PFX
#                           prefix where LIBGCRYPT is installed (optional)
# 
# Some influential environment variables:
#   CC          C compiler command
#   CFLAGS      C compiler flags
#   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#               nonstandard directory <lib dir>
#   LIBS        libraries to pass to the linker, e.g. -l<library>
#   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#               you have headers in a nonstandard directory <include dir>
#   LT_SYS_LIBRARY_PATH
#               User-defined run-time library search path.
#   CPP         C preprocessor
#   PKG_CONFIG  path to pkg-config utility
#   VALGRIND_CFLAGS
#               C compiler flags for VALGRIND, overriding pkg-config
#   VALGRIND_LIBS
#               linker flags for VALGRIND, overriding pkg-config
#   CXX         C++ compiler command
#   CXXFLAGS    C++ compiler flags
#   CXXCPP      C++ preprocessor
#   OBJC        Objective C compiler command
#   OBJCFLAGS   Objective C compiler flags
#   GTKDOC_DEPS_CFLAGS
#               C compiler flags for GTKDOC_DEPS, overriding pkg-config
#   GTKDOC_DEPS_LIBS
#               linker flags for GTKDOC_DEPS, overriding pkg-config
#   PYTHON      the Python interpreter
#   GLIB_CFLAGS C compiler flags for GLIB, overriding pkg-config
#   GLIB_LIBS   linker flags for GLIB, overriding pkg-config
#   GIO_CFLAGS  C compiler flags for GIO, overriding pkg-config
#   GIO_LIBS    linker flags for GIO, overriding pkg-config
#   GST_CFLAGS  C compiler flags for GST, overriding pkg-config
#   GST_LIBS    linker flags for GST, overriding pkg-config
#   GST_BASE_CFLAGS
#               C compiler flags for GST_BASE, overriding pkg-config
#   GST_BASE_LIBS
#               linker flags for GST_BASE, overriding pkg-config
#   GST_CHECK_CFLAGS
#               C compiler flags for GST_CHECK, overriding pkg-config
#   GST_CHECK_LIBS
#               linker flags for GST_CHECK, overriding pkg-config
#   GST_CONTROLLER_CFLAGS
#               C compiler flags for GST_CONTROLLER, overriding pkg-config
#   GST_CONTROLLER_LIBS
#               linker flags for GST_CONTROLLER, overriding pkg-config
#   GST_NET_CFLAGS
#               C compiler flags for GST_NET, overriding pkg-config
#   GST_NET_LIBS
#               linker flags for GST_NET, overriding pkg-config
#   GST_VIDEO_CFLAGS
#               C compiler flags for GST_VIDEO, overriding pkg-config
#   GST_VIDEO_LIBS
#               linker flags for GST_VIDEO, overriding pkg-config
#   GST_AUDIO_CFLAGS
#               C compiler flags for GST_AUDIO, overriding pkg-config
#   GST_AUDIO_LIBS
#               linker flags for GST_AUDIO, overriding pkg-config
#   GST_PBUTILS_CFLAGS
#               C compiler flags for GST_PBUTILS, overriding pkg-config
#   GST_PBUTILS_LIBS
#               linker flags for GST_PBUTILS, overriding pkg-config
#   GST_PLUGINS_BASE_CFLAGS
#               C compiler flags for GST_PLUGINS_BASE, overriding pkg-config
#   GST_PLUGINS_BASE_LIBS
#               linker flags for GST_PLUGINS_BASE, overriding pkg-config
#   GST_PLUGINS_GOOD_CFLAGS
#               C compiler flags for GST_PLUGINS_GOOD, overriding pkg-config
#   GST_PLUGINS_GOOD_LIBS
#               linker flags for GST_PLUGINS_GOOD, overriding pkg-config
#   GST_PLUGINS_UGLY_CFLAGS
#               C compiler flags for GST_PLUGINS_UGLY, overriding pkg-config
#   GST_PLUGINS_UGLY_LIBS
#               linker flags for GST_PLUGINS_UGLY, overriding pkg-config
#   GST_PLUGINS_LIBAV_CFLAGS
#               C compiler flags for GST_PLUGINS_LIBAV, overriding pkg-config
#   GST_PLUGINS_LIBAV_LIBS
#               linker flags for GST_PLUGINS_LIBAV, overriding pkg-config
#   GTK_CFLAGS  C compiler flags for GTK, overriding pkg-config
#   GTK_LIBS    linker flags for GTK, overriding pkg-config
#   GTK3_CFLAGS C compiler flags for GTK3, overriding pkg-config
#   GTK3_LIBS   linker flags for GTK3, overriding pkg-config
#   CLUTTER_CFLAGS
#               C compiler flags for CLUTTER, overriding pkg-config
#   CLUTTER_LIBS
#               linker flags for CLUTTER, overriding pkg-config
#   CLUTTER_GLX_CFLAGS
#               C compiler flags for CLUTTER_GLX, overriding pkg-config
#   CLUTTER_GLX_LIBS
#               linker flags for CLUTTER_GLX, overriding pkg-config
#   CLUTTER_X11_CFLAGS
#               C compiler flags for CLUTTER_X11, overriding pkg-config
#   CLUTTER_X11_LIBS
#               linker flags for CLUTTER_X11, overriding pkg-config
#   XCOMPOSITE_CFLAGS
#               C compiler flags for XCOMPOSITE, overriding pkg-config
#   XCOMPOSITE_LIBS
#               linker flags for XCOMPOSITE, overriding pkg-config
#   GRAPHENE_CFLAGS
#               C compiler flags for GRAPHENE, overriding pkg-config
#   GRAPHENE_LIBS
#               linker flags for GRAPHENE, overriding pkg-config
#   SDL_CFLAGS  C compiler flags for SDL, overriding pkg-config
#   SDL_LIBS    linker flags for SDL, overriding pkg-config
#   GMODULE_EXPORT_CFLAGS
#               C compiler flags for GMODULE_EXPORT, overriding pkg-config
#   GMODULE_EXPORT_LIBS
#               linker flags for GMODULE_EXPORT, overriding pkg-config
#   GMODULE_NO_EXPORT_CFLAGS
#               C compiler flags for GMODULE_NO_EXPORT, overriding pkg-config
#   GMODULE_NO_EXPORT_LIBS
#               linker flags for GMODULE_NO_EXPORT, overriding pkg-config
#   X11_CFLAGS  C compiler flags for X11, overriding pkg-config
#   X11_LIBS    linker flags for X11, overriding pkg-config
#   EXIF_CFLAGS C compiler flags for EXIF, overriding pkg-config
#   EXIF_LIBS   linker flags for EXIF, overriding pkg-config
#   ORC_CFLAGS  C compiler flags for ORC, overriding pkg-config
#   ORC_LIBS    linker flags for ORC, overriding pkg-config
#   X_CFLAGS    C compiler flags for X, overriding pkg-config
#   X_LIBS      linker flags for X, overriding pkg-config
#   GL_CFLAGS   C compiler flags for GL, overriding pkg-config
#   GL_LIBS     linker flags for GL, overriding pkg-config
#   GLES2_CFLAGS
#               C compiler flags for GLES2, overriding pkg-config
#   GLES2_LIBS  linker flags for GLES2, overriding pkg-config
#   EGL_CFLAGS  C compiler flags for EGL, overriding pkg-config
#   EGL_LIBS    linker flags for EGL, overriding pkg-config
#   WAYLAND_EGL_CFLAGS
#               C compiler flags for WAYLAND_EGL, overriding pkg-config
#   WAYLAND_EGL_LIBS
#               linker flags for WAYLAND_EGL, overriding pkg-config
#   GST_ALLOCATORS_CFLAGS
#               C compiler flags for GST_ALLOCATORS, overriding pkg-config
#   GST_ALLOCATORS_LIBS
#               linker flags for GST_ALLOCATORS, overriding pkg-config
#   LIBPNG_CFLAGS
#               C compiler flags for LIBPNG, overriding pkg-config
#   LIBPNG_LIBS linker flags for LIBPNG, overriding pkg-config
#   XCB_CFLAGS  C compiler flags for XCB, overriding pkg-config
#   XCB_LIBS    linker flags for XCB, overriding pkg-config
#   WAYLAND_CFLAGS
#               C compiler flags for WAYLAND, overriding pkg-config
#   WAYLAND_LIBS
#               linker flags for WAYLAND, overriding pkg-config
#   BLUEZ5_CFLAGS
#               C compiler flags for BLUEZ5, overriding pkg-config
#   BLUEZ5_LIBS linker flags for BLUEZ5, overriding pkg-config
#   GIO_UNIX_CFLAGS
#               C compiler flags for GIO_UNIX, overriding pkg-config
#   GIO_UNIX_LIBS
#               linker flags for GIO_UNIX, overriding pkg-config
#   G_UDEV_CFLAGS
#               C compiler flags for G_UDEV, overriding pkg-config
#   G_UDEV_LIBS linker flags for G_UDEV, overriding pkg-config
#   LIBUSB_CFLAGS
#               C compiler flags for LIBUSB, overriding pkg-config
#   LIBUSB_LIBS linker flags for LIBUSB, overriding pkg-config
#   CUDA_CFLAGS C compiler flags for CUDA, overriding pkg-config
#   CUDA_LIBS   linker flags for CUDA, overriding pkg-config
#   NVENCODE_CFLAGS
#               C compiler flags for NvEncodeAPI.h
#   NVENCODE_LIBS
#               linker flags for nvidia-encode
#   ASSRENDER_CFLAGS
#               C compiler flags for ASSRENDER, overriding pkg-config
#   ASSRENDER_LIBS
#               linker flags for ASSRENDER, overriding pkg-config
#   VOAMRWBENC_CFLAGS
#               C compiler flags for VOAMRWBENC, overriding pkg-config
#   VOAMRWBENC_LIBS
#               linker flags for VOAMRWBENC, overriding pkg-config
#   VOAACENC_CFLAGS
#               C compiler flags for VOAACENC, overriding pkg-config
#   VOAACENC_LIBS
#               linker flags for VOAACENC, overriding pkg-config
#   APEXSINK_CFLAGS
#               C compiler flags for APEXSINK, overriding pkg-config
#   APEXSINK_LIBS
#               linker flags for APEXSINK, overriding pkg-config
#   BS2B_CFLAGS C compiler flags for BS2B, overriding pkg-config
#   BS2B_LIBS   linker flags for BS2B, overriding pkg-config
#   CHROMAPRINT_CFLAGS
#               C compiler flags for CHROMAPRINT, overriding pkg-config
#   CHROMAPRINT_LIBS
#               linker flags for CHROMAPRINT, overriding pkg-config
#   CURL_CFLAGS C compiler flags for CURL, overriding pkg-config
#   CURL_LIBS   linker flags for CURL, overriding pkg-config
#   SSH2_CFLAGS C compiler flags for SSH2, overriding pkg-config
#   SSH2_LIBS   linker flags for SSH2, overriding pkg-config
#   LIBXML2_CFLAGS
#               C compiler flags for LIBXML2, overriding pkg-config
#   LIBXML2_LIBS
#               linker flags for LIBXML2, overriding pkg-config
#   LIBDC1394_CFLAGS
#               C compiler flags for LIBDC1394, overriding pkg-config
#   LIBDC1394_LIBS
#               linker flags for LIBDC1394, overriding pkg-config
#   DIRECTFB_CFLAGS
#               C compiler flags for DIRECTFB, overriding pkg-config
#   DIRECTFB_LIBS
#               linker flags for DIRECTFB, overriding pkg-config
#   WAYLAND_PROTOCOLS_CFLAGS
#               C compiler flags for WAYLAND_PROTOCOLS, overriding pkg-config
#   WAYLAND_PROTOCOLS_LIBS
#               linker flags for WAYLAND_PROTOCOLS, overriding pkg-config
#   WEBP_CFLAGS C compiler flags for WEBP, overriding pkg-config
#   WEBP_LIBS   linker flags for WEBP, overriding pkg-config
#   DAALA_CFLAGS
#               C compiler flags for DAALA, overriding pkg-config
#   DAALA_LIBS  linker flags for DAALA, overriding pkg-config
#   DVDNAV_CFLAGS
#               C compiler flags for DVDNAV, overriding pkg-config
#   DVDNAV_LIBS linker flags for DVDNAV, overriding pkg-config
#   FDK_AAC_CFLAGS
#               C compiler flags for FDK_AAC, overriding pkg-config
#   FDK_AAC_LIBS
#               linker flags for FDK_AAC, overriding pkg-config
#   FLUIDSYNTH_CFLAGS
#               C compiler flags for FLUIDSYNTH, overriding pkg-config
#   FLUIDSYNTH_LIBS
#               linker flags for FLUIDSYNTH, overriding pkg-config
#   KATE_CFLAGS C compiler flags for KATE, overriding pkg-config
#   KATE_LIBS   linker flags for KATE, overriding pkg-config
#   TIGER_CFLAGS
#               C compiler flags for TIGER, overriding pkg-config
#   TIGER_LIBS  linker flags for TIGER, overriding pkg-config
#   DRM_CFLAGS  C compiler flags for DRM, overriding pkg-config
#   DRM_LIBS    linker flags for DRM, overriding pkg-config
#   LRDF_CFLAGS C compiler flags for LRDF, overriding pkg-config
#   LRDF_LIBS   linker flags for LRDF, overriding pkg-config
#   LILV_CFLAGS C compiler flags for LILV, overriding pkg-config
#   LILV_LIBS   linker flags for LILV, overriding pkg-config
#   LIBDE265_CFLAGS
#               C compiler flags for LIBDE265, overriding pkg-config
#   LIBDE265_LIBS
#               linker flags for LIBDE265, overriding pkg-config
#   LIBMMS_CFLAGS
#               C compiler flags for LIBMMS, overriding pkg-config
#   LIBMMS_LIBS linker flags for LIBMMS, overriding pkg-config
#   SRTP_CFLAGS C compiler flags for SRTP, overriding pkg-config
#   SRTP_LIBS   linker flags for SRTP, overriding pkg-config
#   DTLS_CFLAGS C compiler flags for DTLS, overriding pkg-config
#   DTLS_LIBS   linker flags for DTLS, overriding pkg-config
#   MODPLUG_CFLAGS
#               C compiler flags for MODPLUG, overriding pkg-config
#   MODPLUG_LIBS
#               linker flags for MODPLUG, overriding pkg-config
#   MIMIC_CFLAGS
#               C compiler flags for MIMIC, overriding pkg-config
#   MIMIC_LIBS  linker flags for MIMIC, overriding pkg-config
#   MJPEG_CFLAGS
#               C compiler flags for MJPEG, overriding pkg-config
#   MJPEG_LIBS  linker flags for MJPEG, overriding pkg-config
#   MPEG2ENC_CFLAGS
#               C compiler flags for MPEG2ENC, overriding pkg-config
#   MPEG2ENC_LIBS
#               linker flags for MPEG2ENC, overriding pkg-config
#   MPLEX_CFLAGS
#               C compiler flags for MPLEX, overriding pkg-config
#   MPLEX_LIBS  linker flags for MPLEX, overriding pkg-config
#   NEON_CFLAGS C compiler flags for NEON, overriding pkg-config
#   NEON_LIBS   linker flags for NEON, overriding pkg-config
#   OFA_CFLAGS  C compiler flags for OFA, overriding pkg-config
#   OFA_LIBS    linker flags for OFA, overriding pkg-config
#   OPENAL_CFLAGS
#               C compiler flags for OPENAL, overriding pkg-config
#   OPENAL_LIBS linker flags for OPENAL, overriding pkg-config
#   OPENCV_CFLAGS
#               C compiler flags for OPENCV, overriding pkg-config
#   OPENCV_LIBS linker flags for OPENCV, overriding pkg-config
#   OPENEXR_CFLAGS
#               C compiler flags for OPENEXR, overriding pkg-config
#   OPENEXR_LIBS
#               linker flags for OPENEXR, overriding pkg-config
#   OPENH264_CFLAGS
#               C compiler flags for OPENH264, overriding pkg-config
#   OPENH264_LIBS
#               linker flags for OPENH264, overriding pkg-config
#   OPENJPEG_CFLAGS
#               C compiler flags for OPENJPEG, overriding pkg-config
#   OPENJPEG_LIBS
#               linker flags for OPENJPEG, overriding pkg-config
#   OPENJPEG_2_1_CFLAGS
#               C compiler flags for OPENJPEG_2_1, overriding pkg-config
#   OPENJPEG_2_1_LIBS
#               linker flags for OPENJPEG_2_1, overriding pkg-config
#   OPENNI2_CFLAGS
#               C compiler flags for OPENNI2, overriding pkg-config
#   OPENNI2_LIBS
#               linker flags for OPENNI2, overriding pkg-config
#   OPUS_CFLAGS C compiler flags for OPUS, overriding pkg-config
#   OPUS_LIBS   linker flags for OPUS, overriding pkg-config
#   PVR_CFLAGS  C compiler flags for PVR, overriding pkg-config
#   PVR_LIBS    linker flags for PVR, overriding pkg-config
#   RSVG_CFLAGS C compiler flags for RSVG, overriding pkg-config
#   RSVG_LIBS   linker flags for RSVG, overriding pkg-config
#   GTK3_GL_CFLAGS
#               C compiler flags for GTK3_GL, overriding pkg-config
#   GTK3_GL_LIBS
#               linker flags for GTK3_GL, overriding pkg-config
#   GTK3_X11_CFLAGS
#               C compiler flags for GTK3_X11, overriding pkg-config
#   GTK3_X11_LIBS
#               linker flags for GTK3_X11, overriding pkg-config
#   GTK3_WAYLAND_CFLAGS
#               C compiler flags for GTK3_WAYLAND, overriding pkg-config
#   GTK3_WAYLAND_LIBS
#               linker flags for GTK3_WAYLAND, overriding pkg-config
#   QT_CFLAGS   C compiler flags for QT, overriding pkg-config
#   QT_LIBS     linker flags for QT, overriding pkg-config
#   QT_X11_CFLAGS
#               C compiler flags for QT_X11, overriding pkg-config
#   QT_X11_LIBS linker flags for QT_X11, overriding pkg-config
#   QT_WAYLAND_CFLAGS
#               C compiler flags for QT_WAYLAND, overriding pkg-config
#   QT_WAYLAND_LIBS
#               linker flags for QT_WAYLAND, overriding pkg-config
#   QT_ANDROID_CFLAGS
#               C compiler flags for QT_ANDROID, overriding pkg-config
#   QT_ANDROID_LIBS
#               linker flags for QT_ANDROID, overriding pkg-config
#   GNUSTL_CFLAGS
#               C compiler flags for GNUSTL, overriding pkg-config
#   GNUSTL_LIBS linker flags for GNUSTL, overriding pkg-config
#   QT_MAC_CFLAGS
#               C compiler flags for QT_MAC, overriding pkg-config
#   QT_MAC_LIBS linker flags for QT_MAC, overriding pkg-config
#   LIBVISUAL_CFLAGS
#               C compiler flags for LIBVISUAL, overriding pkg-config
#   LIBVISUAL_LIBS
#               linker flags for LIBVISUAL, overriding pkg-config
#   TIMIDITY_CFLAGS
#               C compiler flags for TIMIDITY, overriding pkg-config
#   TIMIDITY_LIBS
#               linker flags for TIMIDITY, overriding pkg-config
#   TELETEXTDEC_CFLAGS
#               C compiler flags for TELETEXTDEC, overriding pkg-config
#   TELETEXTDEC_LIBS
#               linker flags for TELETEXTDEC, overriding pkg-config
#   SNDFILE_CFLAGS
#               C compiler flags for SNDFILE, overriding pkg-config
#   SNDFILE_LIBS
#               linker flags for SNDFILE, overriding pkg-config
#   SOUNDTOUCH_CFLAGS
#               C compiler flags for SOUNDTOUCH, overriding pkg-config
#   SOUNDTOUCH_LIBS
#               linker flags for SOUNDTOUCH, overriding pkg-config
#   VDPAU_CFLAGS
#               C compiler flags for VDPAU, overriding pkg-config
#   VDPAU_LIBS  linker flags for VDPAU, overriding pkg-config
#   SBC_CFLAGS  C compiler flags for SBC, overriding pkg-config
#   SBC_LIBS    linker flags for SBC, overriding pkg-config
#   SCHRO_CFLAGS
#               C compiler flags for SCHRO, overriding pkg-config
#   SCHRO_LIBS  linker flags for SCHRO, overriding pkg-config
#   ZBAR_CFLAGS C compiler flags for ZBAR, overriding pkg-config
#   ZBAR_LIBS   linker flags for ZBAR, overriding pkg-config
#   RTMP_CFLAGS C compiler flags for RTMP, overriding pkg-config
#   RTMP_LIBS   linker flags for RTMP, overriding pkg-config
#   SPANDSP_CFLAGS
#               C compiler flags for SPANDSP, overriding pkg-config
#   SPANDSP_LIBS
#               linker flags for SPANDSP, overriding pkg-config
#   NETTLE_CFLAGS
#               C compiler flags for NETTLE, overriding pkg-config
#   NETTLE_LIBS linker flags for NETTLE, overriding pkg-config
#   OPENSSL_CFLAGS
#               C compiler flags for OPENSSL, overriding pkg-config
#   OPENSSL_LIBS
#               linker flags for OPENSSL, overriding pkg-config
#   X265_CFLAGS C compiler flags for X265, overriding pkg-config
#   X265_LIBS   linker flags for X265, overriding pkg-config
#   WEBRTCDSP_CFLAGS
#               C compiler flags for WEBRTCDSP, overriding pkg-config
#   WEBRTCDSP_LIBS
#               linker flags for WEBRTCDSP, overriding pkg-config
# 
# Use these variables to override the choices made by 'configure' or to help
# it to find libraries and programs with nonstandard names/locations.
# 
# Report bugs to <http://bugzilla.gnome.org/enter_bug.cgi?product=GStreamer>.
EOF
)"
#echo  $CONFIGURE_EXT_OPT
#exit 1
./autogen.sh
make
make install
