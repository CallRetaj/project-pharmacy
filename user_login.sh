#!/bin/bash


employee_file="employeeFile.txt"
customer_file="customerFile.txt"


read -p "Enter your username: " username
read -sp "Enter your password: " password
echo

check_login() {
  local username=$1
  local password=$2
  local user_file=$3
  local found=0

  
  while IFS=: read -r file_username file_password; do
    if [[ $file_username == $username ]]; then
      found=1
      if [[ $file_password == $password ]]; then
        echo "Login successful!"
        return 0
      else
        echo "Invalid password. Please try again."
        return 1
      fi
    fi
  done < "$user_file"

  if [[ $found -eq 0 ]]; then
    return 2
  fi
}

check_login "$username" "$password" "$employee_file"
employee_status=$?


if [[ $employee_status -eq 2 ]]; then
  check_login "$username" "$password" "$customer_file"
  customer_status=$?

  if [[ $customer_status -eq 2 ]]; then
    echo "User not found. Please check the username."
  fi
fi

