#!/usr/bin/osascript

# https://github.com/thepoch/iCloudBackup.git

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

  tell application "Safari"
    activate
    delay SecondsDelay
    reopen
    activate
  end tell

  tell application "System Events" to tell process "Safari"
    click menu item "Export Bookmarks…" of menu "File" of menu bar item "File" of menu bar 1
    delay SecondsDelay
    tell application "System Events" to keystroke "g" using {command down, shift down}
    delay SecondsDelay
    tell application "System Events" to keystroke filepath
    delay SecondsDelay
    tell application "System Events" to keystroke return
    delay SecondsDelay
    tell application "System Events" to keystroke filename
    delay SecondsDelay
    tell application "System Events" to keystroke return
    delay SecondsDelay

    if sheet 1 of window "Export Bookmarks" exists then
      click button "Replace" of sheet 1 of window "Export Bookmarks"
    end if
  end tell
end run
