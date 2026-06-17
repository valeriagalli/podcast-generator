FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git 

RUN pip3 install PyYAML

# standard location for linux
COPY feed.py /usr/bin/feed.py

# entrypoint script in root directory
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]