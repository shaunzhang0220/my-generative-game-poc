#!/bin/bash

# Define paths
ENDPOINTS_PATH="configs/endpoints.yml"
CREDENTIALS_PATH="configs/credentials.yml"
MODEL_PATH="models/"
ACTIONS_MODULE="actions"

# Function to clean up SDK server
cleanup() {
    echo "Shutting down Rasa SDK server..."
    # Terminate the Rasa SDK server
    pkill -f 'rasa run actions'
    exit 0
}

# Trap SIGINT and SIGTERM to ensure cleanup is performed when Rasa server is stopped
trap cleanup SIGINT SIGTERM

# Start the Rasa SDK server in the background
./scripts/run_actions.sh &

# Give the Rasa SDK server some time to start
sleep 5

# Run the Rasa server (this will block)
rasa run --endpoints $ENDPOINTS_PATH --credentials $CREDENTIALS_PATH --model $MODEL_PATH --log-file logs/rasa.log

# Check if the Rasa server started successfully
if [ $? -ne 0 ]; then
    echo "Rasa server failed to start."
fi

# Wait for Rasa server to exit, then clean up
wait

# Ensure cleanup is called when the server is stopped
cleanup
