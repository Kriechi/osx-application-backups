#!/usr/bin/osascript

-- https://github.com/thepoch/iCloudBackup.git

on run argv
  try
    set filepath to item 1 of argv
  on error
    return "path required as first argument"
  end try

  try
    set filename to item 2 of argv
  on error
    return "filename required as second argument without file extension"
  end try

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
    keystroke "g" using {command down, shift down}
    delay SecondsDelay
    keystroke filepath
    delay SecondsDelay
    keystroke return
    delay SecondsDelay
    keystroke filename
    delay SecondsDelay
    keystroke return
    delay SecondsDelay

    if sheet 1 of sheet 1 of window 1 exists then
      keystroke space
    end if
  end tell
end run
