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
        echo -e " $R please run the script with root prevelages $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. $R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is.. $G SUCCESS $N" |tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE: : $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}
echo "Script started excuting: $(date)" | tee -a $LOG_FILE
CHECK_ROOT
if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
      echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "Installing $package"
  else
      echo -e "$package is already $Y installed, nothing to do anything.. $N" |tee -a $LOG_FILE
  fi
done