#!/bin/bash

check_user_name(){
if ( grep -qw "$1" costumerFile.txt ) 2>/dev/null
then
	echo "- This user already exists -"
	return 1
elif ( grep -qw "$1" costumerFile.txt ) 2>/dev/null
then
	echo "- This user already exists -"
	return 1
fi
}

check_age(){
if [ "$1" -eq "$1" ] 2>/dev/null
then 
	if [ $1 -lt 15 ] 
	then 
		echo "- You can't register, because of your age - "
		return 1
	fi
	return 0	
else
	echo "- it should be a number -"
	return 1
fi
}

check_phone(){
if [ $1 -eq $1 ] 2>/dev/null
then 
	if [ ${#1} != 10 ]
	then
		echo "the phone number should consist of 10 numbers "
		return 1
	fi
	return 0
	
else
	echo "the phone number should be all numbers "
	return 1
fi
}

check_pass(){

if [ ${#1} -lt 8 ] 2>/dev/null
then 
	echo "- You should put 8 or more numbers and characters -"
	return 1
fi
}


echo "-------------------"
read -p "Enter a username: " uname
check_user_name "$uname"
if [ $? -eq 1 ]; 
then 
	return
fi
echo ""

read -p "Enter your first name: " nameF
read -p "Enter your last name: " nameL
name="$nameF $nameL"
echo ""

read -p "Enter your age: " age
check_age "$age"
if [ $? -eq 1 ]; 
then 
	return
fi
echo ""

read -p "Enter your email: " email
echo ""

read -p "Enter your phone number: " ph
check_phone "$ph"
if [ $? -eq 1 ]; 
then 
	return
fi
echo ""

read -p "Enter the password you want: " password
check_pass "$password"
if [ $? -eq 1 ]; 
then 
	return
fi

# add info
info="$uname $password $nameF $nameL $ph $email $age"
echo $info | cat >> costumerFile.txt
sh custMenu.sh "$uname"




