#!/bin/bash
profile(){
result=$(grep $1 costumerFile.txt)
echo ""
echo "----- MY Profile- ----"
echo "username: $result" | awk '{print $1, $2}'
echo "name: $result" | awk '{print $1, $4, $5}'
echo "age: $result" | awk '{print $1, $8}'
echo "email: $result" | awk '{print $1, $7}'
echo "phone number: $result" | awk '{print $1, $2, $7}'
echo "----------------------"
echo ""
}

search_for_medicine(){
echo "Enter the name of the medicine: "
read med 
v=5
if (grep -w "$med" medicines.txt); then
	echo "--------------------"
	echo "Do you want to buy it?"
	echo "1.yes       2.no, and exit"
	read x
	echo "--------------------"
	if [ $x -eq 1 ]; then
		echo ""
		echo "----- Card Information -----"
		echo "card number: "
		read v
		[ `expr length $v` -ne 16 ] && echo "- WRONG NUMBER -" && return || echo "~~~~~VERIFIED~~~~~"
		echo ""
		echo "name on the card: "
		read v
		echo "~~~~~VERIFIED~~~~~"
		echo " "
		echo "expiration month: "
		read v  
		[ $v -gt 12 ] &&  echo "- WRONG NUMBER -" && return || echo "~~~~~VERIFIED~~~~~"
		echo ""
		echo "expiration year: ex: 25 (2025)"
		read v
		[ `expr length $v` -ne 2 ] &&  echo "- WRONG NUMBER OR FORMULA -" && return || echo "~~~~~VERIFIED~~~~~"
		echo ""
		echo "security code: "
		read v
		[ `expr length $v` != 3 ] && echo "- WRONG NUMBER OR FORMULA -" && return || echo "~~~~~VERIFIED~~~~~" 
		echo ""
		echo "~~~~~Buying succeeded~~~~~"
		echo "~~~~~~~ THANK YOU ~~~~~~~~"
		echo ""
	fi
else 
	echo "- can't find this medicine -"
	echo " "
fi
}
medicine(){
echo ""
echo "--------------------"
echo "Please enter medicine number: "
cat medicines.txt
echo ""
echo "a. Search by medicine name"
echo "b. Exit"
read x
echo ""
if [ $x -eq $x ] 2>/dev/null 
then
	if (grep -w "$x" medicines.txt); then
		echo "--------------------"
		echo "Do you want to buy it?"
		echo "1.yes       2.no, and exit"
		read x
		echo "--------------------"
		if [ $x -eq 1 ]; then
			echo ""
			echo "----- Card Information -----"
			echo "card number: "
			read v
			[ `expr length $v` -ne 16 ] && echo "Try it again next time -The number is incomplete-" && return || echo "~~~~~VERIFIED~~~~~"
			echo ""
			echo "name on the card: "
			read v
			echo "~~~~~VERIFIED~~~~~"
			echo " "
			echo "expiration month: "
			read v  
			[ $v -gt 12 ] &&  echo "- WRONG NUMBER -" && return || echo "~~~~~VERIFIED~~~~~"
			echo ""
			echo "expiration year: ex: 25 (2025)"
			read v
			[ `expr length $v` -ne 2 ] &&  echo "- WRONG NUMBER OR FORMULA -" && return || echo "~~~~~VERIFIED~~~~~"
			echo ""
			echo "security code: "
			read v
			[ `expr length $v` != 3 ] && echo "- WRONG NUMBER OR FORMULA -" && return || echo "~~~~~VERIFIED~~~~~" 
			echo ""
			echo "~~~~~Buying succeeded~~~~~"
			echo "~~~~~~~ THANK YOU ~~~~~~~~"
			echo ""
		else
			return
		fi
	else
		echo "- the number is not exist - "
		echo ""
	fi
elif [ $x = "a" ]; then 
	search_for_medicine
elif [ $x = "b" ]; then
	return
else 
	echo "please enter the number of the medicine, a or b"
fi
}


#user=$(grep $1 costumerFile.txt)
echo "--------------------"
#echo "Hello, $result" | awk '{print $1, $4, $5}'
x=0
while [ $x -ne 3 ]
do 
	echo ""
	echo "What do you want to do now?" 
	echo "1. My profile"
	echo "2. Buy medicine"
	echo "3. Exit"
	read x
	case "$x" in
		"1") profile "$1"
		;;
		"2") medicine
		;;
		"3") return 
		;;
		*) echo "chose 1,2 or 3"
		;;
	esac
done

