FROM ubuntu-latest

RUN apt-get update && apt-get install -y \ # apt-get needed to install things on linux
    python3.10 \ 
    python3-pip \
    git 

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py # standard location for linux

COPY entrypoint.sh /entrypoint.sh # this one in the root directory

ENTRYPOINT ["/entrypoint.sh"]