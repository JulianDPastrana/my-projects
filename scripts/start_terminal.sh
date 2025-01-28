#!/bin/bash

# This script opens a tmux session and prints a terrorific ASCII message.
# If a session name is provided as an argument, it uses that name.
# Otherwise, it defaults to a session named "default".

# Step 1: Check if a session name is passed as a command-line argument
if [ -z "$1" ]; then
    # If no session name is provided, use "default" as the session name
    SESSION_NAME="default"
else
    # If a session name is provided, use it
    SESSION_NAME="$1"
fi

# Step 2: Check if a tmux session with the given name already exists
# "tmux has-session" checks for an existing session
# "2>/dev/null" suppresses error messages if the session doesn't exist
tmux has-session -t "$SESSION_NAME" 2>/dev/null

# Step 3: If the session doesn't exist, create a new one
if [ $? != 0 ]; then
    # Create a new tmux session in detached mode (-d)
    tmux new-session -s "$SESSION_NAME" -d

    # Step 4: Send an ASCII art message to the session
    # Use echo and printf to send the ASCII art message in uppercase letters

    # Add a dramatic line for effect
    tmux send-keys -t "$SESSION_NAME" "echo 'BEWARE... YOU HAVE ENTERED THE REALM OF SHADOWS!'" Enter
fi

# Step 5: Attach to the tmux session, allowing the user to interact with it
tmux attach-session -t "$SESSION_NAME"

