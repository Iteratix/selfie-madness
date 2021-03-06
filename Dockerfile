# Pull base image
FROM resin/rpi-raspbian:jessie
MAINTAINER Andrew Cencini <andrew@vapor.io>

# Install dependencies
RUN apt-get update 
RUN apt-get install -y \
    git-core \
    build-essential \
    gcc \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    --no-install-recommends

RUN rm -rf /var/lib/apt/lists/*

RUN pip install pyserial
RUN git clone git://git.drogon.net/wiringPi
RUN cd wiringPi && ./build
RUN pip install wiringpi2
RUN pip install -r requirements.txt

# Define working directory
WORKDIR /data
VOLUME /data

# Define default command
CMD ["bash"]
