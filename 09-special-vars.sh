#!/bin/bash

echo "All variables passed to the script is: $@"
echo "Number of variables passed to the scripy is: $#"
echo "script name: $0"
echo "Current working directory is: $PWD"
echo "Home directory of current user is: $HOME"
echo "PID of script executing now: $$"
sleep 100 &
echo "PID ofmlast background command: $!"
