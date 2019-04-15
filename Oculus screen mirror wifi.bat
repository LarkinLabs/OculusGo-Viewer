echo off 
d:
cd d:\ADB\platform-tools\
adb disconnect
set IPOLD = <IP.txt
echo Connect Oculus Go via USB, make sure deleoper mode is on. \n or continue to connect to last IP.
pause
adb shell ip route > tmpfile
set /p myvar= <tmpfile
echo/%myvar%
for /f "tokens=9 delims= " %%a in ("%myvar%") do (set ip=%%a)
del tmpfile
set %ip% >IP.txt
echo/Found IP adress : %ip%
echo Disconnect the device's usb 
pause
adb tcpip 5555
adb connect %ip%
adb exec-out "while true; do screenrecord --bit-rate=2m --output-format=h264 --time-limit 180 -; done" | "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --demux h264 --h264-fps=60 --clock-jitter=0 -
adb disconnect
pause