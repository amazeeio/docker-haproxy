FROM golang:1.14-alpine3.13 as builder

LABEL org.opencontainers.image.authors="tobybellwood" maintainer="tobybellwood"
LABEL org.opencontainers.image.source="https://github.com/tobybellwood/docker-haproxy" repository="https://github.com/tobybellwood/docker-haproxy"

RUN set -x \
  && buildDeps='git musl-dev gcc' \
  && apk add --update $buildDeps \
  && GOPATH=/tmp/gocode go get github.com/mailhog/MailHog

FROM alpine:3.13
WORKDIR /bin
COPY --from=builder tmp/gocode/bin/MailHog /bin/MailHog
EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]