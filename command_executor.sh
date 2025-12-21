#!/bin/bash
set -euo pipefail

# Log file location
LOG_DIR="/home/nyan/scripts/log"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/$0_$DATE.log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Timestamp for logging
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Trap for cleanup and error logging
trap 'echo "$TIMESTAMP | Script exited unexpectedly. Last command: $CMD" >> "$LOG_FILE"' ERR EXIT

# Check if a command was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <command>"
    exit 1
fi

# Combine all arguments into a single command string
CMD="$*"

# Validate the command
if [[ -z "$CMD" ]]; then
    echo "Error: No command provided."
    exit 1
fi

# Restrict PATH for safety
export PATH="/usr/bin:/bin"

# Execute the command
echo "Executing: $CMD"

# Log command execution start
echo "$TIMESTAMP | Command: $CMD | Status: Starting" >> "$LOG_FILE"

# Execute command and pipe output line by line
STATUS=0
if eval "$CMD" 2>&1 | while IFS= read -r line; do
    echo "$line"
    echo "$TIMESTAMP | $line" >> "$LOG_FILE"
done; then
    echo "✅ Command executed successfully."
else
    STATUS=$?
    echo "❌ Command failed with exit status $STATUS."
fi

# Log completion
{
    echo "$TIMESTAMP | Command: $CMD | Status: $STATUS"
    echo "----------------------------------------"
} >> "$LOG_FILE"

# Remove trap after successful completion
trap - ERR EXIT

exit $STATUS
