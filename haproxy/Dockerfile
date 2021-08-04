FROM haproxy:1.7-alpine

LABEL org.opencontainers.image.authors="tobybellwood" maintainer="tobybellwood"
LABEL org.opencontainers.image.source="https://github.com/tobybellwood/docker-haproxy" repository="https://github.com/tobybellwood/docker-haproxy"

RUN apk update && apk --no-cache add bash

COPY --from=jwilder/docker-gen:latest /usr/local/bin/docker-gen /usr/local/bin/docker-gen

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/haproxy_start.sh"]
EXPOSE 80 443
