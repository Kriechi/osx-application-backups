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

  tell application "Contacts"
    activate
    delay SecondsDelay
    reopen
    activate
  end tell

  tell application "Contacts"
    set fullfilepath to (filepath & "/" & filename & ".vcf")
    display dialog fullfilepath
    set exportfile to (open for access file fullfilepath with write permission)

    repeat with per in people
      write (vcard of per as text) to exportfile
    end repeat
    close access exportfile
  end tell
end run
