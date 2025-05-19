#!/bin/bash

echo "hello world!"
echo "My current working directory is"
pwd

myname="apple"
echo "My name is $myname"


now=$(date)      #need no space in equal
echo "Current time is $now"

# maths function

expr 5 + 5  #need space around operator
expr 5 \* 5

#if statements

mynum=500               #again no space around equal
if [ $mynum -eq 200 ]   #space is required
then
    echo "the condition is true"
else
    echo "the condition is false" 
fi                     #closing if
#condition are -eq -gt -lt -le -ge -ne