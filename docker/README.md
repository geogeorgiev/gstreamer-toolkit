# GSTREAMER

## Sources
`fdsrc` - use in conjunction with unix pipes a
`videotestsrc` - use to do tests, you specify a `pattern=<num>`
`fakesrc` - another option for testing with empty stream. 
`filesrc` - specify a `location=` and stream from file
`tcpclientsrc` - stream from the internet via TCP, specify `host=` and `port=`
`v4l2sr` - stream from a camera device on a linux system, specify `device=`

## Sinks
`udpsink`
`tcpserversink`
`rtmpsink`
`audoaudiosink`
`autovideosink`
`filesink` 
`fakesink`

## VIDEO

### Test source

  gst-launch-1.0 videotestsrc pattern=1 ! videoconvert ! autovideosink
  gst-launch-1.0 -v fakesrc silent=false num-buffers=3 ! fakesink silent=false
  gst-launch-1.0 videotestsrc num-buffers=1 ! jpegenc ! filesink location=videotestsrc-frame.jpg

## AUDIO

### Test source
  gst-launch-1.0 audiotestsrc ! audioconvert ! autoaudiosink
  gst-launch-1.0 -v fakesrc silent=false num-buffers=3 ! fakesink silent=false

### File source
  gst-launch-1.0 filesrc location=s.ogg ! oggdemux ! vorbisdec ! audioconvert ! autoaudiosink
  gst-launch-1.0 filesrc location=s.mp3 ! mp3parse ! mad ! audioconvert ! autoaudiosink

### Decode anything module

  gst-launch-1.0 filesrc location=s.mp3 ! mp3parse ! mad ! audioconvert ! autoaudiosink
  gst-launch-1.0 filesrc location=s.mp3 ! decodebin2 ! mad ! audioconvert ! autoaudiosink

### Karaoke
  
  gst-launch-1.0 filesrc location=s.mp3 ! decodebin2 ! audiokaraoke ! audioconvert ! autoaudiosink

## INSPECTING/LEARNING
### E.G:
  
  man gst-launch-1.0
  gst-inspect-1.0 | grep mp3 | sort | head -3
  gst-inspect-1.0 playbin > gst-inspect-playbin.txt
