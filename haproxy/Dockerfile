FROM haproxy:1.8-alpine3.14

RUN apk update && apk --no-cache add bash

COPY --from=jwilder/docker-gen:latest /usr/local/bin/docker-gen /usr/local/bin/docker-gen

COPY . /app/
WORKDIR /app/

ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/haproxy_start.sh"]
EXPOSE 80 443
