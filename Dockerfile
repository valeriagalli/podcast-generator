FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git 

RUN pip3 install PyYAML

# standard location for linux
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh # this one in the root directory

ENTRYPOINT ["/entrypoint.sh"]