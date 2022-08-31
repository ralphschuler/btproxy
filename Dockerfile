FROM debian:latest

ENV MASTER_ADDRESS=""
ENV SLAVE_ADDRESS=""

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python3 \
    python3-pip \
    bluez \
    bluez-tools \
    libbluetooth-dev \
    python3-dev

RUN python3 setup.py install

CMD [ "btproxy",  "${MASTER_ADDRESS}",  "${SLAVE_ADDRESS}" ]