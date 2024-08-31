#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

VALIDATE(){
    echo "exit status: $1"
}

if [ $USERID -ne 0 ]
then
    echo "please run the script with root preveleges"
    exit 1
fi

dnf list installed git

VALIDATE $?