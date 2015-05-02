#!/usr/bin/osascript

-- https://github.com/jamietr1/evernote-backup.git

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

  tell application "Evernote"
    activate
    delay SecondsDelay
    reopen
    activate
  end tell

  set fullfilepath to (filepath & "/" & filename & ".enex")

  tell application "Evernote"
    set matches to find notes "created:19900101"
    export matches to fullfilepath
  end tell
end run
