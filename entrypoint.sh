#!/bin/bash
# Specify the system shell path to interpret this script

echo "==========================="  # Visual separator for clean action logging

# Configure Git identity using dynamic GitHub environment variables
git config --global user.name "${GITHUB_ACTOR}" # Set global commit author name to the triggering user
git config --global user.email "${INPUT_EMAIL}" # Set global commit author email from action input metadata

# Trust the default GitHub Actions working directory to prevent strict ownership errors
git config --global --add safe.directory /github/workspace 

# Execute the core python script to regenerate the podcast files
python3 /usr/bin/feed.py

# Stage, commit, and sync the newly generated feed files back to GitHub
git add -A # Track all new, modified, and deleted files in the workspace
git commit -m "Update feed" 
git push --set-upstream origin main # Push changes and establish tracking for this branch on a clean runner

echo "===========================" 
