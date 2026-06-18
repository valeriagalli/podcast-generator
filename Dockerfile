FROM ubuntu:latest

# Update the package list and install system dependencies
# The trailing backslash (\) safely continues the command on the next line
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git 

# Install Python dependencies required for parsing configuration data
RUN pip3 install PyYAML

# Copy the core Python processing script into the standard Linux binaries path
COPY feed.py /usr/bin/feed.py

# Copy the startup orchestrator script into the root directory
COPY entrypoint.sh /entrypoint.sh

# Grant executable permissions to the entrypoint script to prevent permission errors
RUN chmod +x /entrypoint.sh

# Configure the container to execute the entrypoint script as its primary process on boot
ENTRYPOINT ["/entrypoint.sh"]
