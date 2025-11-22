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
        if mkdir -p "$2" 2>/dev/null; then
            echo "Folder '$2' created."
            log_action "SUCCESS: Created folder '$2'"
        else
            echo "Failed to create folder '$2'."
            log_action "ERROR: Failed to create folder '$2'"
        fi
        ;;
    create-file)
        if touch "$2" 2>/dev/null; then
            echo "File '$2' created."
            log_action "SUCCESS: Created file '$2'"
        else
            echo "Failed to create file '$2'."
            log_action "ERROR: Failed to create file '$2'"
        fi
        ;;
    list-folder)
        if [ -d "$2" ]; then
            ls -lh "$2"
            log_action "SUCCESS: Listed folder '$2'"
        else
            echo "Folder '$2' does not exist."
            log_action "ERROR: Folder '$2' not found"
        fi
        ;;
    move-file)
        if [ -f "$2" ]; then
            if mv "$2" "$3" 2>/dev/null; then
                echo "File moved from '$2' to '$3'."
                log_action "SUCCESS: Moved file '$2' -> '$3'"
            else
                echo "Failed to move file."
                log_action "ERROR: Failed to move file '$2' -> '$3'"
            fi
        else
            echo "Source file '$2' does not exist."
            log_action "ERROR: Source file '$2' not found"
        fi
        ;;
    copy-file)
        if [ -f "$2" ]; then
            if cp "$2" "$3" 2>/dev/null; then
                echo "File copied from '$2' to '$3'."
                log_action "SUCCESS: Copied file '$2' -> '$3'"
            else
                echo "Failed to copy file."
                log_action "ERROR: Failed to copy file '$2' -> '$3'"
            fi
        else
            echo "Source file '$2' does not exist."
            log_action "ERROR: Source file '$2' not found"
        fi
        ;;
    delete-file)
        if [ -f "$2" ]; then
            if rm -f "$2" 2>/dev/null; then
                echo "File '$2' deleted."
                log_action "SUCCESS: Deleted file '$2'"
            else
                echo "Failed to delete file."
                log_action "ERROR: Failed to delete file '$2'"
            fi
        else
            echo "File '$2' does not exist."
            log_action "ERROR: File '$2' not found"
        fi
        ;;
    delete-folder)
        if [ -d "$2" ]; then
            if rm -rf "$2" 2>/dev/null; then
                echo "Folder '$2' deleted."
                log_action "SUCCESS: Deleted folder '$2'"
            else
                echo "Failed to delete folder."
                log_action "ERROR: Failed to delete folder '$2'"
            fi
        else
            echo "Folder '$2' does not exist."
            log_action "ERROR: Folder '$2' not found"
        fi
        ;;
    show-log)
        if [ -f "$LOG_FILE" ]; then
            cat "$LOG_FILE"
        else
            echo "No log file found."
        fi
        ;;
    *)
        echo "Invalid action!"
        echo "Usage: ./file_manager.sh <action> [arguments]"
        log_action "ERROR: Invalid action '$action'"
        ;;
esac

echo "----------------------------------------" >> "$LOG_FILE"
