#!/bin/bash

#Colors Declaration
# shellcheck disable=SC2006
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
BOLD=$(tput bold)
#Reading Parameters from the user
param1=${1}
param2=${2:-EmptyPath}
counter=5
passCounter=1

function checkPassword {

  if [ ${#password} -lt 10 ]; then
    echo "${RED}[] Password is too short. It should be at least 10 characters long." >>error.log
    counter=$((counter - 1))
  fi

  if [[ $password != *[[:upper:]]* ]]; then
    echo "${RED}[] Password must contain at least one uppercase letter" >>error.log
    counter=$((counter - 1))
  fi
  if [[ $password != *[[:lower:]]* ]]; then
    echo "${RED}[] Password must contain at least one lowercase letter" >>error.log
    counter=$((counter - 1))
  fi
  if [[ $password != *[[:digit:]]* ]]; then
    echo "${RED}[] Password must contain at least one digit" >>error.log
    counter=$((counter - 1))
  fi
  if [[ $password != *['!'@#\$%^\&*()_+]* ]]; then
    echo "${RED}[] Password must contain at least one special character" >>error.log
    counter=$((counter - 1))
  fi

  if [ $counter -lt 5 ]; then
    echo "${RED}Password is not strong enough. Please check the following:"
    cat ./error.log && rm -rf ./error.log
  else
    echo "${GREEN}Password is strong enough."
  fi

# Calibrating the counter
  counter=5

}

if [ "$param1" == "-f" ]; then
  if [ "$param2" == "EmptyPath" ]; then
    echo "${RED}Please enter the path to the file"
    exit 1
  fi
  if [ ! -f "$param2" ]; then
    echo "${RED}File does not exist"
    exit 1
  fi
  while read -r password; do
    [ -z "$password" ] && continue

    echo "${BOLD}${BLUE}Password Number $passCounter:"
    checkPassword
    passCounter=$((passCounter + 1))
    echo " "

  done <"$param2"
else
  password=$param1
  checkPassword
fi
