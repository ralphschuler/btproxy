FROM debian:8.2

ENV BUILD_PACKAGES="bluez bluez-tools libbluetooth-dev python-dev python-pip wget zip"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean &&\
    apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get install -y $BUILD_PACKAGES && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /btproxy

RUN wget https://github.com/pybluez/pybluez/archive/master.zip -O /tmp/pybluez.zip && \
    unzip /tmp/pybluez.zip -d /tmp && \
    cd /tmp/pybluez-master && \
    python setup.py install

RUN cd btproxy; python setup.py install

WORKDIR /workdir