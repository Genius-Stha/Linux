#!/bin/bash

var0=0
var1=1
read a
while [ $a -ne 0 ];
do 
    echo $var0
    var2=$(($var0+$var1))
    var0=$var1
    var1=$var2
    a=$(($a-1))
done

