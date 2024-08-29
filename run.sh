#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status
set -x  # Print commands and their arguments as they are executed

# Setting environment variables
export STATIC_DIR=/static 
export DB_FILE=keepclone.db

# Generate and export keys, with fallback if commands fail
export COOKIE_STORE_KEY=$(uuidgen | base64 || echo "default_cookie_store_key")
export SESSION_STORE_KEY=$(uuidgen | base64 || echo "default_session_store_key")

# Debugging: Print out the variables to ensure they are set correctly
echo "STATIC_DIR: $STATIC_DIR"
echo "DB_FILE: $DB_FILE"
echo "COOKIE_STORE_KEY: $COOKIE_STORE_KEY"
echo "SESSION_STORE_KEY: $SESSION_STORE_KEY"

# Start the server
./server
