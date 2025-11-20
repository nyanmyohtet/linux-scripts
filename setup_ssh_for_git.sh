#!/bin/bash

# Get user input for name and email
read -p "Enter your git user name: " name
read -p "Enter your git email: " email

# Set git config globally for user name and email
git config --global user.name "$name"
git config --global user.email "$email"

# Check git config for user name and email
git config --global --list

# echo -n "Enter your email address: "
# read email

# Generate a new SSH key using ed25519 algorithm
# run without prompting for input (like file location or passphrase)
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""

# Add the key to the ssh-agent
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519

# Copy the public key to the clipboard
# sudo apt-get install -y xclip
# xclip -sel clip < ~/.ssh/id_ed25519.pub

# echo "Your public key has been copied to the clipboard. Please add it to your GitHub account."

# Print the public key
cat ~/.ssh/id_ed25519.pub

echo "Please copy the above key and add it to your GitHub account."
