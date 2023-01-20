#!/bin/bash

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
