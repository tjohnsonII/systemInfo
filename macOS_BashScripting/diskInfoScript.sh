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


#set format variables
divider="=============================="
dividerb=$divider$divider$divider$divider
header="\n%-10s %8s %40s %11s\n\n"
format="%-10s %8s %40s  %11s\n\n"
width=$(tput cols)

#fucntion declarations


#Output
printf "%s\n" "${BOLD}${BLUE}Starting Disk Info Script${NORMAL}"

printf "%s\n" "${GREEN}Disk Info${NORMAL}"

diskUtil list

df -h

sudo diskutil info -all

system_profiler SPStorageDataType

system_profiler SPUSBDataType

printf "\n\n\n\n%s\n" "${BOLD}${RED}End Of Script${NORMAL}"


