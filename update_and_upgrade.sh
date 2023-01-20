#!/bin/bash

green='\033[0;32m'
nc='\033[0m' # No Color

# Default value for flag
do_upgrade=false

while getopts ":u" opt; do
  case $opt in
    u)
      do_upgrade=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

echo -e "${green}Updating package lists...${nc}"
sudo apt update

if [ "$do_upgrade" = true ] ; then
  echo -e "${green}Upgrading packages...${nc}"
  sudo apt upgrade -y
else
  echo -e "${green}Skipping upgrading packages...${nc}"
  echo -e "${green}Add '-u' flag to upgrad packages...${nc}"
fi

# echo "Dist-upgrading packages..."
# sudo apt dist-upgrade -y

echo -e "${green}Cleaning up...${nc}"
sudo apt autoremove -y
sudo apt autoclean -y

echo -e "${green}Updating and upgrading process completed!${nc}"
