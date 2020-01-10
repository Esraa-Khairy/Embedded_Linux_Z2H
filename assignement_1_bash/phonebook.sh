#!/bin/bash



if [ -e /etc/phonebook.tx ]
	then
		echo ""
else
	 touch /etc/phonebook.txt
fi

case $1 in
	-i)
		read -p "enter contact name:  " name 
		read -p "enter contact number:  " num
		echo "$name : $num" >> /etc/phonebook.txt;;
	-v)
		cat /etc/phonebook.txt;;
	-s)
		read -p "enter a contact name you want to search of:  " n
		grep $n /etc/phonebook.txt;;
	-e)
		>phonebook.txt;;
	-d)
		read -p "write the contact name you want to delete:  " d
		sed -i "/$d/d" /etc/phonebook.txt ;;
		

		 
		
*)
	echo "Sorry Wrong option! try again ^_^"
esac
