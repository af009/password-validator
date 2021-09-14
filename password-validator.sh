#!/bin/bash

#Colors Declaration
RED=`tput setaf 1`
GREEN=`tput setaf 2`

password=${1}
password_length=${#password}


#We check if the password contains lower/upper letters and digits
function checkPass {

	if [[ $password == *[[:upper:]]* ]];
	then
		if [[ $password == *[[:digit:]]* ]];
		then
			if [[ $password == *[[:lower:]]* ]];
			then
				echo "${GREEN} Password Test Passed, Congrats!"
				return 0
			else
				echo "${RED} The password must contain at least 1 lower letter"
				return 1
			fi
		else
			echo "${RED} The Password must contain at least 1 digit"
			return 1
		fi
	else
		echo "${RED} The password must contain at least 1 Upper letter"
		return 1
	fi

}

#We check the password length, if matches the minimum requirements we run the checkpass function
function main {

	if [[ $password_length -lt 10 ]]
	then
		echo "${RED} The password must contain at least 10 characters"
		return 1
	else
		checkPass
	fi

}

main

# print return from the checkPass/main function
echo $?
