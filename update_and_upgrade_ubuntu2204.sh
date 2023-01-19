#!/bin/bash

# You can run this script by making the file executable with chmod +x <script_name>.sh and running it with ./<script_name>.sh
# Please note that this script is just an example, and you should always verify that the packages that will be updated or upgraded are compatible with your system and will not cause any issues.

echo "Updating package lists..."
sudo apt update

echo "Upgrading packages..."
sudo apt upgrade -y

# echo "Dist-upgrading packages..."
# sudo apt dist-upgrade -y

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Updating and upgrading process completed!"
