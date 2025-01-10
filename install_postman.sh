#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Download the latest Postman tar file
echo "Downloading Postman..."
wget -q https://dl.pstmn.io/download/latest/linux -O postman.tar.gz

# Extract the tar file
echo "Extracting Postman..."
tar -xzf postman.tar.gz

# Move Postman to /opt directory
echo "Moving Postman to /opt..."
sudo mv Postman /opt/postman

# Create a symlink for easy access
echo "Creating symlink for Postman..."
sudo ln -s /opt/postman/Postman /usr/bin/postman

# Create a desktop entry
echo "Creating desktop entry for Postman..."
cat <<EOL | sudo tee /usr/share/applications/postman.desktop
[Desktop Entry]
Name=Postman
Exec=/usr/bin/postman
Icon=/opt/postman/app/resources/app/assets/icon.png
Type=Application
Categories=Development;
Terminal=false
EOL

# Clean up the downloaded tar file
echo "Cleaning up..."
rm postman.tar.gz

# Completion message
echo "Postman installation completed! You can launch it from your applications menu or by typing 'postman' in the terminal."
