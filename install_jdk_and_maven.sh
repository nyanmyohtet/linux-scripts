#!/bin/bash

# Update package list
sudo apt update

# Install OpenJDK 11
sudo apt install -y openjdk-11-jdk

# Install Maven
sudo apt install -y maven

# Verify the installation
java -version
mvn -v
