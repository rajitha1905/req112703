#!/bin/bash

# Script for running the API locally with Docker Compose

# Change to script dir
cd $(dirname ${BASH_SOURCE[0]})

# Setup Poetry and install dependencies
curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"

# Install dependencies
poetry install --no-root -vvv --sync

# Activate the virtual environment
source $(poetry env info --path)/bin/activate

# Start the app
poetry run fastapi dev --host 0.0.0.0 --port 3000 src/sample_api/main.py 
