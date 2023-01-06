#!/bin/bash

# find all ISO files 
for x in $(find . -name '*.ISO'); do 
# needed to strip .ISO out of folder name
y="${x#'./'}"
# tell me you are gettin' busy
echo "Starting conversion of $y -> ${y%'.ISO'}"
# make dir of /output/path/ISO_FILE/*.mkv
# but only if dir does not exist yet
if [[ ! -d "/path/to/DVD_ISO_DIR/${y%'.ISO'}" ]]; then
mkdir -p "/path/to/DVD_ISO_DIR/${y%'.ISO'}"
# convert them all, ignore tracks shorter than minlength (if you only care about the main movie)
makemkvcon --minlength=1200 mkv iso:"$x" all "/run/media/umino/Backup6T/DVD_MOVIES/${y%'.ISO'}"; 
# report if finished
echo "Conversion of $y done."
else
  echo "Directory ${y%'.ISO'} already exists"
fi
done;

