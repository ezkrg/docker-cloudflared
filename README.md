# docker-cloudflared

docker-compose example:

```
version: '3.7'

services:
  cloudflared:
    image: ezkrg/cloudflared:latest
    command: [ "proxy-dns" ]
    environment:
      - TUNNEL_DNS_ADDRESS=0.0.0.0
      - TUNNEL_DNS_PORT=3553
      - TUNNEL_METRICS=0.0.0.0:46211
    networks:
      int: {}
    ports:
      - 3553:3553
      - 3553:3553/udp
      - 46211:46211
```
