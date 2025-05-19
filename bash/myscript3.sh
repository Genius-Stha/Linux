#!/bin/bash

#echo $? #exit status of last command 0 if sucessful
package=htop

sudo pacman -S --noconfirm $package

echo "The exit code is: $?"         # $ sign help to execute inside echo

if [ $? -eq 0 ]; then
    echo "The installation of the $package was successful"
else
    echo "The installation of the $package was not successful"
fi

#manupulate the exit code

directory=/etc

if [ -d $directory ]; then
    echo "$directory exists"
    exit 0
else 
    echo"$directory doesn't exist"
    exit 1

#here if exit code is always zero if their is no exit statement
#exit 1 or 0 will exit the code with exit code of 1 or 0 ($?)
