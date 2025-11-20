#!/bin/bash

# Log file location
LOG_FILE="/home/nyan/scripts/log/command_executor.log"

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

# Timestamp for logging
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Execute the command
echo "Executing: $CMD"
OUTPUT=$(eval "$CMD" 2>&1)
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
echo "$TIMESTAMP | Command: $CMD | Status: $STATUS" >> "$LOG_FILE"
echo "$OUTPUT" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

exit $STATUS
