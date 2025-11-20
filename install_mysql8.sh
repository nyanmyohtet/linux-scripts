#!/bin/bash

# Update package lists
sudo apt update

# Add MySQL APT repository
sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb
sudo apt update

# Install MySQL 8.0
sudo apt install -y mysql-server

# Secure MySQL installation
sudo mysql_secure_installation

# Start MySQL service
sudo systemctl start mysql

# Enable MySQL service to start on boot
sudo systemctl enable mysql

