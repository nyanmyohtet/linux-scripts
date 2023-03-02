#!/bin/bash

sudo pacman -Syu

sudo pacman -S docker

sudo systemctl start docker.service

sudo systemctl enable docker.service

sudo usermod -aG docker $USER

echo "Please logout/reboot to effect usermod"

echo "run docker run hello-world to confirm installion"
