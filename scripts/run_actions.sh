#!/bin/bash

# Define the path to the actions module
ACTIONS_MODULE="actions"

# Run the Rasa SDK server and redirect output to a log file
rasa run actions --actions $ACTIONS_MODULE > logs/actions.log 2>&1 &

# Check if the action server started successfully
if [ $? -eq 0 ]; then
    echo "Rasa SDK server for custom actions is running."
else
    echo "Failed to start the Rasa SDK server. Please check the logs for details."
    exit 1
fi