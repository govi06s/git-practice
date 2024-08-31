#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run the script with root preveleges"

fi

dnf install git -y
