# Configs Directory

This directory is dedicated to storing all configuration files related to Rasa. The files in this directory include:

- **config.yml**: Configuration for Rasa's NLU and pipelines.
- **domain.yml**: Defines the domain of the Rasa bot, including intents, entities, slots, responses, and actions.
- **endpoints.yml**: Specifies the endpoints for custom actions, trackers, and other services.
- **credentials.yml**: Stores credentials for third-party services that Rasa interacts with, such as messaging platforms.
- **stories/**: Contains story files that outline the conversation flows for training the Rasa model.
  - **nlu.yml**: Natural Language Understanding training data.
  - **stories.yml**: Dialogue stories used for training.
  - **rules.yml**: Rule-based dialogue management.
