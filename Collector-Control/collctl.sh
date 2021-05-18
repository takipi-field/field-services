#!/bin/bash
#NAME: Todd Keyser
#DATE: 05-13-2021
#Version: 1.0

# For Collectors that run without root
# No arguments checks to see if the Collector is running and returns the pid if it is
# 'start' will start the Collector via a 'nohup' command
# 'stop' will stop the Collector via a 'kill -9' command

# Pretty print at a given line of text with "=" lines above and below
bprint()
{
   BORDER=$(echo "$*" | sed 's/./=/g')
   echo -ne "\n${BORDER}\n${*}\n${BORDER}\n"
}

# Set variable to Collector pid
colPid=$(ps -ef | grep takipi-service |  grep -v grep | awk '{ print $2}')

# Argument checks and actions
if [ -z "$colPid" ] && [ $# -eq 0 ]; then
  bprint "The Collector is not running"
  exit 1
fi
if [ $# -eq 0 ]; then
  bprint "The Collector is running with PID: $colPid"
  exit 1
fi
if [ $1 == "start" ]; then
  if [ ! -z "$colPid" ]; then
    bprint "The Collector is already running with PID: $colPid"
  else
    nohup /opt/takipi/bin/takipi-service 1>/dev/null 2>/dev/null &
    bprint "The Collector has been started"
    exit 1
  fi
fi
if [ $1 == "stop" ]; then
  if [ -z "$colPid" ]; then
    bprint "The Collector was not running"
  else
    kill -9 $(ps -ef | grep takipi-service |  grep -v grep | awk '{ print $2}')
    bprint "The Collector has been stopped"
    exit 1
  fi
fi
