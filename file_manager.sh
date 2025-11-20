#!/bin/bash
set -euo pipefail

# Usage:
# ./file_manager.sh <action> [arguments]
# Actions:
#   create-folder <folder>
#   create-file <file>
#   list-folder <folder>
#   move-file <source> <destination>
#   copy-file <source> <destination>
#   delete-file <file>
#   delete-folder <folder>

# Check if a action was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <action>"
    exit 1
fi

action=$1

case $action in
    create-folder)
        mkdir -p "$2"
        echo "Folder '$2' created."
        ;;
    create-file)
        touch "$2"
        echo "File '$2' created."
        ;;
    list-folder)
        ls -lh "$2"
        ;;
    move-file)
        mv "$2" "$3"
        echo "File moved from '$2' to '$3'."
        ;;
    copy-file)
        cp "$2" "$3"
        echo "File copied from '$2' to '$3'."
        ;;
    delete-file)
        rm -f "$2" # <- No prompt, force delete
        echo "File '$2' deleted."
        ;;
    delete-folder)
        rm -rf "$2" # <- No prompt, force delete folder
        echo "Folder '$2' deleted."
        ;;
    *)
        echo "Invalid action!"
        echo "Usage: ./file_manager.sh <action> [arguments]"
        ;;
esac
