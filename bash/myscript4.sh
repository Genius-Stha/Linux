#!/bin/bash

var=1;
while [ $var -le 10 ]
do 
    echo $var
    var=$(( $var +1 ))  #no space around equal
    # (()) is for arithmetic operation only
    sleep 1
done;

