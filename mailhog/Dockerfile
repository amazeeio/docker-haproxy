FROM golang:1.14-alpine3.13 as builder

RUN set -x \
  && buildDeps='git musl-dev gcc' \
  && apk add --update $buildDeps \
  && GOPATH=/tmp/gocode go get github.com/mailhog/MailHog

FROM alpine:3.14
WORKDIR /bin
COPY --from=builder tmp/gocode/bin/MailHog /bin/MailHog
EXPOSE 1025 8025
ENTRYPOINT ["MailHog"]