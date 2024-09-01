#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log
mkdir -p $LOGS_FOLDER


USERID=$(id -u)

#echo "UserID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "please rin the script with root prevelages" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. FAILED" &>>$LOG_FILE
        exit 1
    else
        echo "$2 is.. SUCCESS" &>>$LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
  dnf list installed $package &> $LOG_FILE
  if [ $? -ne 0 ]
  then
      echo "$package is not installed, going to install it.." &>>$LOG_FILE
      dnf install $package -y &>> $LOG_FILE
      VALIDATE $? "Installing $package"
  else
      echo "$package is already installed, nothing to do anything.." &>>$LOG_FILE
  fi
done