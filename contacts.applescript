#!/usr/bin/osascript

# https://github.com/thepoch/iCloudBackup.git

set SecondsDelay to 1

tell application "Contacts"
  activate
  delay SecondsDelay
  reopen
  activate
end tell

tell application "System Events" to tell process "Contacts"
  click menu item "Contacts Archive…" of menu "Export…" of menu item "Export…" of menu "File" of menu bar item "File" of menu bar 1
  delay SecondsDelay
  keystroke ContactsBackup
  delay SecondsDelay
  keystroke "d" using {command down}
  delay SecondsDelay
  keystroke return
  delay SecondsDelay
  if sheet 1 of sheet 1 of window 1 exists then
    keystroke space
  end if
end tell
