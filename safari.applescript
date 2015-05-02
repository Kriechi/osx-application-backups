#!/usr/bin/osascript

# https://github.com/thepoch/iCloudBackup.git

set SecondsDelay to 1

tell application "Safari"
  activate
  delay SecondsDelay
  reopen
  activate
end tell

tell application "System Events" to tell process "Safari"
  click menu item "Export Bookmarks…" of menu "File" of menu bar item "File" of menu bar 1
  delay SecondsDelay
  keystroke SafariBackup
  delay SecondsDelay
  keystroke "d" using {command down}
  delay SecondsDelay
  click button "Save" of window "Export Bookmarks"
  delay SecondsDelay
  if sheet 1 of window "Export Bookmarks" exists then
    click button "Replace" of sheet 1 of window "Export Bookmarks"
  end if
end tell
