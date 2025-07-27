#!/usr/bin/env bash

# Check main option existing
if [ -z "$1" ]; then
    echo -e "Error option.\nUse 'os help'."
    exit 1 # exit with error
fi

if [ "$1" == "help" ]; then
  echo -e "Usage: os [ switch | boot | test | help ] [ update | offline]\n"
  echo "Options"
  echo -e "
  switch\tBuild and activate new configuration, and make it boot default.
  boot\t\tBuild new configuration and make it boot default.
  test\t\tBuild and activate new configuration.
  help\t\tPrint this message.

  update\tUpdate flake inputs.
  offline\tOffline rebuild."
  exit 0 # just exit
fi

# Get device name
hardware_model=$(hostnamectl status | grep "Hardware Model" | awk -F': ' '{print $2}')
# Check if everything is ok.
if [ -z "$hardware_model" ]; then
    echo "The hardware model was not found."
fi

# Rename model name to simple format
if [ "$hardware_model" == "IdeaPad 5 Pro 14ACN6" ]; then
    hardware_model="lenovo"
elif [ "$hardware_model" == "G1621-02" ]; then
    hardware_model="gpd-pocket-3"
else
    hardware_model="default"
fi

# Check second option in command
if [ "$2" == "update" ]; then
    second_option="-u"
elif [ "$2" == "offline" ]; then
    second_option="-- --offline"
else
    second_option=""
fi

# run rebuild with nh program
nh os $1 -H $hardware_model $second_option || 
echo -e "\nError option.\nUse 'os help'."
