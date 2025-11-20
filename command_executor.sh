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
OUTPUT=$(eval "$CMD" 2>&1 || true)  # Capture output even if command fails
STATUS=$?

# Print results
if [ $STATUS -eq 0 ]; then
    echo "✅ Command executed successfully."
    echo "Output:"
    echo "$OUTPUT"
else
    echo "❌ Command failed with exit status $STATUS."
    echo "Error Output:"
    echo "$OUTPUT"
fi

# Log the execution details
{
    echo "$TIMESTAMP | Command: $CMD | Status: $STATUS"
    echo "$OUTPUT"
    echo "----------------------------------------"
} >> "$LOG_FILE"

# Remove trap after successful completion
trap - ERR EXIT

exit $STATUS
