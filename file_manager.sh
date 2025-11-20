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

# Log file location
LOG_DIR="/home/nyan/scripts/log"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/$0_$DATE.log"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $1" >> "$LOG_FILE"
}

action=$1

case $action in
    create-folder)
        mkdir -p "$2"
        echo "Folder '$2' created."
        log_action "Created folder: $2"
        ;;
    create-file)
        touch "$2"
        echo "File '$2' created."
        log_action "Created file: $2"
        ;;
    list-folder)
        ls -lh "$2"
        log_action "Listed folder: $2"
        ;;
    move-file)
        mv "$2" "$3"
        echo "File moved from '$2' to '$3'."
        log_action "Moved file: $2 -> $3"
        ;;
    copy-file)
        cp "$2" "$3"
        echo "File copied from '$2' to '$3'."
        log_action "Copied file: $2 -> $3"
        ;;
    delete-file)
        rm -f "$2"
        echo "File '$2' deleted."
        log_action "Deleted file: $2"
        ;;
    delete-folder)
        rm -rf "$2"
        echo "Folder '$2' deleted."
        log_action "Deleted folder: $2"
        ;;
    *)
        echo "Invalid action!"
        echo "Usage: ./file_manager.sh <action> [arguments]"
        log_action "Invalid action attempted: $action"
        ;;
esac
