FROM haproxy:2.2-alpine

RUN apk update && apk --no-cache add bash curl

ENV DOCKER_GEN_VERSION 0.7.6

RUN ARCH=$(case $(uname -m) in i386 | i686 | x86) echo "i386" ;; x86_64 | amd64) echo "amd64" ;; aarch64 | arm64 | armv8) echo "arm64" ;; *) echo "amd64" ;; esac) \
    && curl -A "Docker" -o /tmp/docker-gen.tar.gz -D - -L -s https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-$ARCH-$DOCKER_GEN_VERSION.tar.gz \
    && tar -C /usr/local/bin -xvzf /tmp/docker-gen.tar.gz \
    && chmod +x /usr/local/bin/docker-gen

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/haproxy_start.sh"]
EXPOSE 80 443
