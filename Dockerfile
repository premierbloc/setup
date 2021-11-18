FROM alpine:3.14

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git

COPY entrypoint.sh /entrypoint.sh

env

ENTRYPOINT ["/entrypoint.sh"]