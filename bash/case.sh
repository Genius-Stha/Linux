#!/bin/bash

end=0;

while [ $end -ne 1 ];
do 
    echo "Which is your favourite distro?";
    echo "1.Arch";
    echo "2.Ubuntu";
    echo "3.POP";


read -n 1 -p " distro :" distro     #-n (number) -1 (one character) -p "prompt before input"

case $distro in
    1) echo -e "\nYou have chosen Arch";;   #-e let you use escape characters
    2) echo -e "\nYou have chosen Ubuntu";;
    3) echo -e "\nYou have chosen POP";;
    4) end=1;echo -e  "\nYou have chosen exit";;
    *) echo -e "\nYou have chosen an invalid option";;
esac
done