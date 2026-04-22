#!/bin/bash
set -e

# Activate virtual environment
source /app/.venv/bin/activate

cd /app

# Start Jupyter Lab in the foreground
exec jupyter lab --allow-root --ip=0.0.0.0 --no-browser --IdentityProvider.token=''
