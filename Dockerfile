FROM ubuntu:16.04

ENV BUILD_PACKAGES software-properties-common wget nano
ENV DOCKER_GEN_VERSION 0.7.0
RUN apt-get update && \
    apt-get -y install $BUILD_PACKAGES && \
    add-apt-repository ppa:vbernat/haproxy-1.6 && \
    apt-get update && \
    apt-get -y install haproxy && \
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
