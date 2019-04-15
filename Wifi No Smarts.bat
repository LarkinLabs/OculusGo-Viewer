echo off 
SETLOCAL EnableDelayedExpansion
d:
cd d:\ADB\platform-tools\


#!/system/bin/env busybox ash

MUSIC_LIBRARY=/sdcard/Data

LAST_UPDATE="$(stat -c %Y "$MUSIC_LIBRARY/.last-update")"

find "$MUSIC_LIBRARY" -type f ! -iname ".last-update" | (
  while read f; do
    if ! test "$LAST_UPDATE" -ge "$(stat -c %Y "$f")"; then
      am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d "file://$f"
      touch "$f"
    else
      echo "Not updated: \`$f'"
    fi
  done
)

touch "$MUSIC_LIBRARY/.last-update"
pause