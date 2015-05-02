#!/usr/bin/osascript

# https://github.com/jamietr1/evernote-backup.git

# file extension .enex

set f to "$filename"
tell application "Evernote"
  set matches to find notes "created:19900101"
  export matches to f
end tell
