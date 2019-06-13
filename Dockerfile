FROM ubuntu:xenial

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential libreadline-dev libconfig-dev libssl-dev \
    lua5.2 liblua5.2-dev libevent-dev libjansson-dev \
    libpython-dev make git ca-certificates ruby \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root/telegram-cli
RUN git clone --recursive https://github.com/vysheng/tg.git && cd tg && ./configure && make
RUN git clone https://github.com/tvdstaaij/telegram-history-dump.git

COPY ./config.yaml ./telegram-history-dump

RUN useradd -ms /bin/bash telegramd

VOLUME /root/output
