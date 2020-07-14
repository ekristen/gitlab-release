FROM alpine:edge
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ curl jq jo
COPY gitlab-release /usr/local/bin
COPY --from=minio/mc /usr/bin/mc /bin/mc

