#!/bin/sh

#set -x

nohup /Users/tim2/Documents/systemInfo/quickNet.sh > netInfo.txt &
nohup /Users/tim2/Documents/systemInfo/diskInfoScript.sh > diskInfo.txt &
nohup /Users/tim2/Documents/systemInfo/serviceInfoScript.sh  > serviceInfo.txt &
nohup /Users/tim2/Documents/systemInfo/userInfoScript.sh > userInfo.txt &

zip -r systemInfo.zip netInfo.txt diskInfo.txt serviceInfo.txt userInfo.txt &
tar -zcvf systemInfo.tar.gz netInfo.txt diskInfo.txt serviceInfo.txt userInfo.txt &
tar -jcvf systemInfo.tar.bz2 netInfo.txt diskInfo.txt serviceInfo.txt userInfo.txt &

