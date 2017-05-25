FROM haproxy:1.7-alpine

RUN apk update && apk --no-cache add bash

ENV DOCKER_GEN_VERSION 0.7.3

ADD https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz /tmp/docker-gen.tar.gz

RUN tar -C /usr/local/bin -xvzf /tmp/docker-gen.tar.gz && \
    chmod +x /usr/local/bin/docker-gen

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/haproxy_start.sh"]
EXPOSE 80 443
