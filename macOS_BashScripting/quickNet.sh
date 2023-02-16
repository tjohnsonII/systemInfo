#!/bin/sh

ifconfig -a
arp -a
netstat -a
netstat -r
netstat -avp tcp | grep -i established
