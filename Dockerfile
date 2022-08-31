FROM debian:latest

WORKDIR /app

COPY . /app

RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN apt-get install -y python3 \
    python3-pip \
    bluez \
    bluez-tools \
    libbluetooth-dev \
    python3-dev
RUN apt-get install -y \
    sudo \
    procps
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 setup.py install

CMD [ "btproxy",  "${MASTER_ADDRESS}",  "${SLAVE_ADDRESS}" ]