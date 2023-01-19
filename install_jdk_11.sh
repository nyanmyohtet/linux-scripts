#!/bin/bash

# Update package list
sudo apt-get update

# Install OpenJDK 11
sudo apt-get install -y openjdk-11-jdk

# Install Maven
sudo apt-get install -y maven

# Verify the installation
java -version
mvn -v
