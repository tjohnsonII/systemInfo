#!/bin/sh

#Remove pound sign for debug mode
#set -x

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
BLINK=$(tput blink)
UNDERLINE=$(tput smul)
RESET=$(tput sgr0)
    
#set script variables
network=$(ifconfig -a)
mac2ip=$(arp -a)
networkLocationsList=$(networksetup -listlocations)
theCmds=($network,$mac2ip,networkLocationsList)

#set format variables
divider="=============================="
dividerb=$divider$divider$divider$divider
header="\n%-10s %8s %40s %11s\n\n"
format="%-10s %8s %40s  %11s\n\n"
width=$(tput cols)

#fucntion declarations
function getOut(){
    printf "%s\n" "${RED}END OF LOG FILE${NORMAL}"
    printf "\n\n\n\n%s\n" "${BOLD}${RED}End Of Script${NORMAL}"
    exit
}

function wipeTerminal(){
    clear
    cd ~/Documents/systemInfo
    printf "%s\n" "${BOLD}${BLUE}Starting Network Info Script${NORMAL}"

    printf "%s\n" "${GREEN}Log File Initialization Info${NORMAL}"

    printf "%s\n" "${GREEN}Start of log file${NORMAL}"
}

function netInfo(){
    #create log file
    touch netWorkLog.log
    
    #run long network commands in the background and route to
    # log file
    allOpenPorts=$(nohup netstat -a >> netWorkLog.log &)
    routingTable=$(nohup netstat -r >> netWorkLog.log &)
    
    #set local variable to true to indicate function is running
    local running=true
    netstatCmdPsChk=$(ps aux | grep netstat | grep -v grep)
    echo $netstatCmdPsChk
    #loop until background processes stop
    while [[ running == true ]]; do
        #if process exist print output
        echo $netstatCmdPsChk
        if [[ -n "$netstatCmdPsChk" ]]; then
            printf "%s\f\r" "${BLINK}${RED} STILL WORKING !!! ${NORMAL}"
            clear
        #else set function running variable to false
        else
            running=false
            printf "%s\f\r\n" "netstat -a and netstat -r completed"
        fi
    done
    
    #append the remaining command output to log file
    for i in "${theCmds[@]}"; do
        echo "$i" >> netWorkLog.log
    done
}


#Output
wipeTerminal
netInfo
getOut
