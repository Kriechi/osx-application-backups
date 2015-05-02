#!/usr/bin/osascript

set myBackupName to "AddressBook.vcf"

set myTimeStamp to (year of (current date)) & (month of (current date) as number) & (day of (current date))
set myBackupPath to the (path to the documents folder as string) & myTimeStamp & "-" & myBackupName as string

tell application "Finder"
  if exists (file myBackupPath) then
    delete file myBackupPath
  end if
end tell

tell application "Contacts"
  set myBackupFile to (open for access file myBackupPath with write permission)

  repeat with per in people
    write (vcard of per as text) to myBackupFile
  end repeat
  close access myBackupFile
end tell
