FROM alpine:3.14

LABEL org.opencontainers.image.authors="tobybellwood" maintainer="tobybellwood"
LABEL org.opencontainers.image.source="https://github.com/tobybellwood/docker-haproxy" repository="https://github.com/tobybellwood/docker-haproxy"

RUN apk --no-cache add dnsmasq-dnssec=~2.85
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]