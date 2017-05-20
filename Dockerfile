FROM ubuntu:16.04

ENV BUILD_PACKAGES software-properties-common wget nano
ENV RUNTIME_PACKAGES haproxy liblua5.3-0 libssl1.0.0
ENV DOCKER_GEN_VERSION 0.7.0
COPY 01_nodoc /etc/dpkg/dpkg.cfg.d/01_nodoc
RUN apt-get update && \
    apt-get -y install $BUILD_PACKAGES && \
    add-apt-repository ppa:vbernat/haproxy-1.6 && \
    apt-get update && \
    apt-get -y install $RUNTIME_PACKAGES && \
    wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz && \
    tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz && \
    rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz && \
    apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/haproxy_start.sh"]
EXPOSE 80 443
