FROM alpine:3.10

ARG CLOUDFLARED_VERSION="2019.11.3"

RUN apk --update --no-cache add ca-certificates \
 && apk --update --no-cache --virtual .build-deps add \
        git \
        go \
        build-base \
 && cd /tmp \
 && git clone -n https://github.com/cloudflare/cloudflared.git \
 && cd cloudflared \
 && git checkout ${CLOUDFLARED_VERSION} \
 && make cloudflared \
 && cp cloudflared /usr/local/bin/ \
 && rm -rf /tmp/* \
 && apk del .build-deps

CMD [ "/usr/local/bin/cloudflared" ]