d:
cd d:\ADB\platform-tools\
adb disconnect
adb exec-out "while true; do screenrecord --bit-rate=10m --output-format=h264 --time-limit 180 -; done" | "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --demux h264 --h264-fps=60 --clock-jitter=0 --network-caching=100--sout-mux-caching=100 -