#!/bin/bash

USERID=$(id -u)

#echo "UserID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 command is FAILED"
    else
        echo "$2 command is success"
}

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
    VALIDATE $? "Installing git"
else
    echo "git is already installed, nothing to do anything.."
fi

dnf install mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed, going to install it.."
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MYSQL installation was done, nothing to do"
fi