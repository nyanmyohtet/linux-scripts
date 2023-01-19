#!/bin/bash

echo -n "Enter your email address: "
read email

# Generate a new SSH key using ed25519 algorithm
ssh-keygen -t ed25519 -C "$email"

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
