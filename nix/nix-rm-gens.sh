#!/usr/bin/env bash

# Check if param was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <day>" 
    exit 1
fi

nix-env --delete-generations $1 --profile /nix/var/nix/profiles/system

