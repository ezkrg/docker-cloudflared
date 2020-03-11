FROM golang:1.13-alpine as builder

ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOOS=linux

WORKDIR /go/src/github.com/cloudflare/cloudflared/

COPY cloudflared/ .

RUN apk add --update --no-cache build-base git \
 && make cloudflared

# ---

FROM alpine:3.11

COPY --from=builder --chown=nobody /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/

USER nobody

ENTRYPOINT ["cloudflared", "--no-autoupdate"]

CMD ["version"]