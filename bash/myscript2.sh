#!/bin/bash
if [ -e "myscript.sh" ]; then
    echo "file exists."
else
    echo "file doesn't exits"
fi

# -e: File exists
# -f: File is a regular file
# -d: Directory exists
# -r: File is readable
# -w: File is writable
# -x: File is executable

command=/usr/bin/htop

if [ -f $command ]; then 
    echo "$command exists"
else
    sudo pacman -S --noconfirm htop
fi

htop

