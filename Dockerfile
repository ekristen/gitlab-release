FROM alpine:edge
COPY gitlab-release /usr/local/bin
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ curl jq jo && chmod +x /usr/local/bin/gitlab-release
