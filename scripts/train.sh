#!/bin/bash

# Define paths
CONFIG_PATH="configs/config.yml"
DOMAIN_PATH="configs/domain.yml"
DATA_PATH="configs/stories"
MODEL_PATH="models/"

# Train the Rasa model
rasa train --config $CONFIG_PATH --domain $DOMAIN_PATH --data $DATA_PATH --out $MODEL_PATH

# Check if the training was successful
if [ $? -eq 0 ]; then
    echo "Model training completed successfully. Model saved in $MODEL_PATH"
else
    echo "Model training failed. Please check the logs for details."
    exit 1
fi