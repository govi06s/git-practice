#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "please rin the script with root prevelages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. FAILED"
        exit 1
    else
        echo "$2 is.. SUCCESS"
    fi
}

CHECK_ROOT
