#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. FAILED"
        exit 1
    else
        echo "$2 is.. SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script with root preveleges"
    exit 1
fi

dnf list installed git

VALIDATE $? "Listing MYSQL"