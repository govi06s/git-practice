#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run the script with root preveleges"
    exit 1
fi

dnf install gittt -y

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
else
    echo "git is already installed, nothing to do anything.."
fi
