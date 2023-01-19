#!/bin/bash

echo -n "Enter your name: "
read name

echo -n "Enter your email address: "
read email

# Set the global git user name and email
git config --global user.name "$name"
git config --global user.email "$email"

echo "Git user name and email have been set."

