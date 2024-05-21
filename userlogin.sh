#!/bin/sh

employee_file="employeeFile.txt"
customer_file="costumerFile.txt"


echo -n "Enter your username: "
read username
echo -n "Enter your password: "
read password


user_credentials="$username $password"

check_login() {
  local user_credentials=$1
  local user_file=$2


  if grep -qw "^$username $password" "$user_file"; then
    echo "Login successful"
    return 0
  else
    if grep -qw "^$username" "$user_file"; then
      echo "Invalid password Please try again"
      return 1
    else
      return 2
    fi
  fi
}

check_login "$user_credentials" "$employee_file"
employee_status=$?

if [ $employee_status -eq 2 ]; then
  check_login "$user_credentials" "$customer_file"
  customer_status=$?

  if [ $customer_status -eq 2 ]; then
    echo "User not found Please check the username thank you"
  fi
fi


if [ $employee_status -eq 0 ]; then
	sh employeeCasesCode.sh
elif [ $customer_status -eq 0 ]; then
	sh custMenu.sh "$username"
fi
