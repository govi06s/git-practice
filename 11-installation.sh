#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run the script with root preveleges"
    exit 1
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installation is not success... please check it"
        exit 1
    else
        echo "git installation sucsess... nothing do"
    fi
else
    echo "git is already installed, nothing to do anything.."
fi
