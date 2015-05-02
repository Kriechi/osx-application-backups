#!/usr/bin/osascript

on run argv
  try
    set filename to item 1 of argv
  on error
    set filename to "chrome-bookmarks"
  end try

  set SecondsDelay to 1

  tell application "Google Chrome"
    activate
    open location "chrome://bookmarks/"
    delay SecondsDelay
    execute front window's active tab javascript "chrome.bookmarks.export();"
    delay SecondsDelay
    tell application "System Events" to keystroke filename
    tell application "System Events" to keystroke "d" using command down
    tell application "System Events" to keystroke return
    delay SecondsDelay

    --if sheet 1 of sheet 1 of window 1 exists then
    --  tell application "System Events" to keystroke space
    --end if
  end tell
end run
