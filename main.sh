#!/bin/bash

x=0
while [ $x -ne 3 ]
do
	echo "             __   "
	echo "         /__________\\  "
	echo "         /\\/\\/\\/\\/\\/\\  "
	echo "         |__________| "
	echo "         |----------|   "
	echo "         | PHARMACY |   "
	echo "         |__________| "
	echo "         |----------| "
	echo "         \\__________/  "
	echo ""
	echo "    ,.,.,.,.WELCOME,.,.,.,."
	echo ""
	echo "Enter the number of your option: "
	echo "1.log in"
	echo "2.create account"
	echo "3.exit"
	read x
	echo "" 
	case $x in
		1) sh userlogin.sh
		;;
		2) sh CreateAccount.sh
		;;
		3) 
		;;
		*) echo "- Please choose 1,2 or 3 -"
		;;
	esac
done
	echo " \n          __   "
	echo "         /__________\\  "
	echo "         /\\/\\/\\/\\/\\/\\  "
	echo "         |__________| "
	echo "         |----------|   "
	echo "         | PHARMACY |   "
	echo "         |__________| "
	echo "         |----------| "
	echo "         \\__________/  "
	echo ""
	echo "    ,.,.,.,.THANK YOU,.,.,.,."
