#!/usr/bin/osascript

-- by Thomas Kriechbaumer

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

  tell application "Google Chrome"
    activate
    open location "chrome://bookmarks/"
    delay SecondsDelay
    execute front window's active tab javascript "chrome.bookmarks.export();"
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



    --if sheet 1 of sheet 1 of window 1 exists then
    --  tell application "System Events" to keystroke space
    --end if
  end tell
end run
