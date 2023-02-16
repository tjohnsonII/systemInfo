#!/bin/zsh

#Remove pound sign for debug mode
#set -x

#clear terminal screen
clear

#change to root of directory
cd /

#setup color ouput variables
NORMAL=$(tput sgr0)
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
RESET=$(tput sgr0)

#set script variables
whoseLoggedIN=$(whoami)
whoHasBeenIN=$(who -a)
CWD=$(pwd)
Filename_of_shell_script=$(echo "$0")
HowManyUsers=$(users | wc -l)

#set format variables
divider="=============================="
dividerb=$divider$divider$divider$divider
header="\n%-10s %8s %40s %11s\n\n"
format="%-10s %8s %40s  %11s\n\n"
width=$(tput cols)

#fucntion declarations
function checkLogin(){
    if [[ $HowManyUsers > 1 ]]; then
        printf "%s\n" "${RED}boot users${NORMAL}"
    else
        printf "%s\n" "${GREEN}No Intruders${NORMAL}"
    fi
}

#Output
printf "%s\n" "${BOLD}${BLUE}Starting Info Script${NORMAL}"

printf "$header" "COMMAND" "FLAG" "OUTPUT" "DEFINITION"

printf "%$width.${width}s\n" "$dividerb"

printf "$format" 'whoami' 'n/a' $whoseLoggedIN 'who is currently logged in'

printf "$format" 'pwd' 'n/a' $CWD 'current working directory'

printf "$format" 'echo' '$0' $Filename_of_shell_script 'current script location'

printf "%s \t %s\n" "Command" "who -a"

printf "%s\n" "${UNDERLINE}All logged in users${NORMAL}"

printf "%s\n" $whoHasBeenIN

checkLogin



printf "\n\n\n\n%s\n" "${BOLD}${RED}End Of Script${NORMAL}"


